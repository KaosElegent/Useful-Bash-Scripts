#!/bin/bash
while true
do
	if [ $(cat /sys/class/power_supply/BAT0/capacity) -gt 80 ] && ( cat /sys/class/power_supply/BAT0/status | grep "Charging" > /dev/null )
	then
		notify-send "Your Battery is over 80%" "Consider Unplugging" -u critical
	fi

	if [ $(cat /sys/class/power_supply/BAT0/capacity) -lt 25 ] && ( cat /sys/class/power_supply/BAT0/status | grep "Discharging" > /dev/null )
	then
		notify-send "Your Battery is Under 25%" "Consider Using AC" -u critical
	fi

	sleep 10m
done

