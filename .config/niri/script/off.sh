#!/usr/bin/env bash

CONFIG_FILE="/home/falguren/.config/niri/config.kdl"
TMP_FILE="${CONFIG_FILE}.tmp"

# Считываем текущий статус HDMI-A-1
EDP_BLOCK=$(awk '/output "HDMI-A-1"[[:space:]]*\{/,/\}/' "$CONFIG_FILE")

if echo "$EDP_BLOCK" | grep -q 'off'; then
    # Включаем монитор: удаляем строку с "off"
    awk '
        BEGIN {inside=0}
        /output "HDMI-A-1"[[:space:]]*\{/ {inside=1}
        inside && /off/ {next}
        inside && /\}/ {inside=0}
        {print}
    ' "$CONFIG_FILE" > "$TMP_FILE" && mv "$TMP_FILE" "$CONFIG_FILE"
    notify-send -u normal "Монитор HDMI-A-1 Включен"
    echo "Монитор HDMI-A-1 включен."
else
    # Выключаем монитор: добавляем "off" после строки с открывающей скобкой
    awk '
        BEGIN {inside=0}
        /output "HDMI-A-1"[[:space:]]*\{/ {
            print
            print "    off"
            inside=1
            next
        }
        inside && /\}/ {inside=0}
        {print}
    ' "$CONFIG_FILE" > "$TMP_FILE" && mv "$TMP_FILE" "$CONFIG_FILE"
    notify-send -u normal "Монитор HDMI-A-1 Выключен"
    echo "Монитор HDMI-A-1 Выключен."
fi
