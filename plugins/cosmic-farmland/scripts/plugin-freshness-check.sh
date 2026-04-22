#!/usr/bin/env bash
# SessionStart hook: warn if installed cosmic-farmland cache lags behind marketplace source.
#
# Root cause we're guarding against: Claude Code's plugin cache occasionally pins to an
# old commit even when `/plugin update` runs. Symptom: user types /ptv (or any command
# added after the pinned sha) and gets "Unknown command". This hook surfaces drift
# loudly on every SessionStart so we stop guessing.

set -u

plugin_root="${CLAUDE_PLUGIN_ROOT:-}"
marketplace_src="$HOME/.claude/plugins/marketplaces/cosmic-farmland/plugins/cosmic-farmland"

[ -z "$plugin_root" ] && exit 0
[ ! -d "$marketplace_src" ] && exit 0

warn() {
  cat <<EOF
{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":$1}}
EOF
}

installed_commands=$(cd "$plugin_root/commands" 2>/dev/null && ls 2>/dev/null | sort | tr '\n' ' ')
source_commands=$(cd "$marketplace_src/commands" 2>/dev/null && ls 2>/dev/null | sort | tr '\n' ' ')
installed_skills=$(cd "$plugin_root/skills" 2>/dev/null && ls 2>/dev/null | sort | tr '\n' ' ')
source_skills=$(cd "$marketplace_src/skills" 2>/dev/null && ls 2>/dev/null | sort | tr '\n' ' ')

if [ "$installed_commands" = "$source_commands" ] && [ "$installed_skills" = "$source_skills" ]; then
  exit 0
fi

missing_cmds=""
for c in $source_commands; do
  case " $installed_commands " in *" $c "*) ;; *) missing_cmds="$missing_cmds $c" ;; esac
done
missing_skills=""
for s in $source_skills; do
  case " $installed_skills " in *" $s "*) ;; *) missing_skills="$missing_skills $s" ;; esac
done

msg="cosmic-farmland plugin cache is stale. Installed commands differ from marketplace source."
[ -n "$missing_cmds" ] && msg="$msg Missing commands:$missing_cmds."
[ -n "$missing_skills" ] && msg="$msg Missing skills:$missing_skills."
msg="$msg Run: /plugin update cosmic-farmland@cosmic-farmland (and reinstall if that doesn't sync)."

warn "$(printf '%s' "$msg" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))')"
