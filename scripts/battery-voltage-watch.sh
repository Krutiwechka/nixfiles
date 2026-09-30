#!/usr/bin/env bash

BAT_PATH="/sys/class/power_supply/BMBT"
AC_PATH="/sys/class/power_supply/ADP5"


WARN_THRESHOLD=8000000 
CRITICAL_THRESHOLD=7800000 

COOLDOWN=120
LAST_WARN=0
LAST_CRIT=0

while true; do
  AC_ONLINE=$(cat "$AC_PATH/online" 2>/dev/null || echo 1)
  
  if [ "$AC_ONLINE" = "0" ]; then
    VOLTAGE=$(cat "$BAT_PATH/voltage_now")
    CAPACITY=$(cat "$BAT_PATH/capacity")
    NOW=$(date +%s)

    if [ "$VOLTAGE" -lt "$CRITICAL_THRESHOLD" ]; then
      if [ $((NOW - LAST_CRIT)) -gt "$COOLDOWN" ]; then
        notify-send -u critical "⚠️ КРИТИЧНО: напряжение батареи" \
          "Voltage: $((VOLTAGE/1000))mV, Capacity: ${CAPACITY}%. Риск выключения."
        LAST_CRIT=$NOW
      fi
    elif [ "$VOLTAGE" -lt "$WARN_THRESHOLD" ]; then
      if [ $((NOW - LAST_WARN)) -gt "$COOLDOWN" ]; then
        notify-send -u normal "🔋 Внимание: низкое напряжение батареи" \
          "Voltage: $((VOLTAGE/1000))mV, Capacity: ${CAPACITY}%."
        LAST_WARN=$NOW
      fi
    fi
  fi

  sleep 10
done
