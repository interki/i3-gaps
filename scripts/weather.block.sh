#!/bin/bash

command -v jq >/dev/null 2>&1 || { echo >&2 "Program 'jq' required but it is not installed.  Aborting."; exit 1; }
command -v wget >/dev/null 2>&1 || { echo >&2 "Program 'wget' required but is not installed.  Aborting."; exit 1; }

# customisation: 

DARK_APIKEY="be3c5e1b5870e42570ce6dd5d23a3c13"
DARK_LOCATION="-27.7175,153.2045"
DARK_UNITS="ca"
ALARMING_TEMP=30
ALARMING_WIND=30

DARK_CALL="https://api.darksky.net/forecast/$DARK_APIKEY/$DARK_LOCATION?units=$DARK_UNITS"
DARK_WEATHER=$( wget -qO- "$DARK_CALL" )

WEATHER_TEMP=$( echo "$DARK_WEATHER" | jq '.currently.temperature')
WEATHER_TEMP_ROUND=$( echo "$WEATHER_TEMP" | xargs printf "%.*f\n" 0 )
WEATHER_ICON=$( echo "$DARK_WEATHER" | jq '.currently.icon' | sed 's/"//g')
WIND_BEARING=$( echo "$DARK_WEATHER" | jq '.currently.windBearing')
WEATHER_SUMMARY=$( echo "$DARK_WEATHER" | jq '.currently.summary' | sed 's/"//g')
## pressure unit = hPa -1000.
# WEATHER_PRESSURE="$( echo "$DARK_WEATHER" | jq '.currently.pressure' | sed 's/^..//' )"
WEATHER_PRESSURE="$( echo "$DARK_WEATHER" | jq '.currently.pressure' | sed 's/^..//' )"
WIND_SPEED_RAW=$( echo "$DARK_WEATHER" | jq '.currently.windSpeed')
WIND_SPEED_ROUND=$( echo $WIND_SPEED_RAW | xargs printf "%.*f\n" 0 )


case $WEATHER_ICON in
  'clear-day')
    ICON_USED=""
    ;;
  'clear-night')
    ICON_USED=""
    ;;
  'rain')
    ICON_USED=""
    ;;
  'snow')
    ICON_USED=""
    ;;
  'sleet')
    ICON_USED=""
    ;;
  'wind')
    ICON_USED=""
    ;;
  'fog')
    ICON_USED=""
    ;;
  'cloudy')
    ICON_USED=""
    ;;
  'partly-cloudy-day')
    ICON_USED=""
    ;;
  'partly-cloudy-night')
    ICON_USED=""
    ;;
  *)
    ICON_USED=""
    ;;
esac

## with summary
# echo "${ICON_USED} $WEATHER_TEMP_ROUND°C ~$WEATHER_SUMMARY~ ${WIND_SPEED_ROUND}kph $WIND_BEARING° $WEATHER_PRESSURE"
# echo "${ICON_USED} $WEATHER_TEMP_ROUND°C ~$WEATHER_SUMMARY~ ${WIND_SPEED_ROUND}kph $WIND_BEARING° $WEATHER_PRESSURE"

## without summary
echo "${ICON_USED} $WEATHER_TEMP_ROUND°C ${WIND_SPEED_ROUND}kph $WIND_BEARING° $WEATHER_PRESSURE"
echo "${ICON_USED} $WEATHER_TEMP_ROUND°C ${WIND_SPEED_ROUND}kph $WIND_BEARING° $WEATHER_PRESSURE"

awk "BEGIN { if ( $WEATHER_TEMP_ROUND > $ALARMING_TEMP || ${WIND_SPEED_ROUND} > $ALARMING_WIND ) { print \"#f58312\" } }"
# awk "BEGIN { if ( $WEATHER_ICON == "rain" ) { print \"#72cbd8\" } }"
