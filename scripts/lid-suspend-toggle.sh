#!/bin/bash

set -euo pipefail

readonly SUSPEND_TARGETS=(sleep.target suspend.target hibernate.target hybrid-sleep.target)

notify() {
  notify-send --app-name="ai-mode-toggle" --expire-time=3000 --transient \
    --hint="string:x-canonical-private-synchronous:ai-mode-toggle" "$1"
}

if [[ "$(systemctl is-enabled suspend.target 2>/dev/null)" == masked ]]; then
  sudo -n systemctl unmask "${SUSPEND_TARGETS[@]}" 2>/dev/null \
    || pkexec systemctl unmask "${SUSPEND_TARGETS[@]}"
  notify "AI Mode: off"
else
  sudo -n systemctl mask "${SUSPEND_TARGETS[@]}" 2>/dev/null \
    || pkexec systemctl mask "${SUSPEND_TARGETS[@]}"
  notify "AI Mode: on"
fi
