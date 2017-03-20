#!/usr/bin/env bash

command -v jq >/dev/null 2>&1 || { echo >&2 "Program 'jq' required but it is not installed.  Aborting."; exit 1; }
command -v wget >/dev/null 2>&1 || { echo >&2 "Program 'wget' required but is not installed.  Aborting."; exit 1; }

# customisation: 

BOM_PRODUCT="IDQ60901/IDQ60901.94576.json" # Brisbane
APIKEY="b7203deeb0acf5fc8383ee3b62bfb922"
CITY_ID="2143440" # Windaroo, Aus
ALARMING_TEMP=30
ALARMING_WIND=30

# end of customisations

# take temp, wind speed & direction from Bureau of Met. and the rest from openweathermap.org:
BOM_URL="http://reg.bom.gov.au/fwo/$BOM_PRODUCT"
BOM_WEATHER=$( wget -qO- "$BOM_URL" )
WEATHER_TEMP=$( echo "$BOM_WEATHER" | jq '.observations.data[0].air_temp' )
WIND_SPEED=$( echo "$BOM_WEATHER" | jq '.observations.data[0].wind_spd_kmh' )
WIND_DIR=$( echo "$BOM_WEATHER" | jq '.observations.data[0].wind_dir' )

URL="http://api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&units=metric&APPID=${APIKEY}"

WEATHER_RESPONSE=$(wget -qO- "${URL}")

WEATHER_CONDITION=$(echo $WEATHER_RESPONSE | jq '.weather[0].main' | sed 's/"//g')
## WEATHER_TEMP=$(echo $WEATHER_RESPONSE | jq '.main.temp')
## TEMP_MIN=$(echo $WEATHER_RESPONSE | jq '.main.temp_min')
## TEMP_MAX=$(echo $WEATHER_RESPONSE | jq '.main.temp_max')
# round temp to nearest 0.1
## WEATHER_TEMP=$( awk "BEGIN {printf \"%.1f\\n\", $WEATHER_TEMP}" )
## WIND_DIR=$( echo "$WEATHER_RESPONSE" | jq '.wind.deg')
## WIND_SPEED=$( echo "$WEATHER_RESPONSE" | jq '.wind.speed')
SUNRISE=$( echo "$WEATHER_RESPONSE" | jq '.sys.sunrise' )
SUNSET=$( echo "$WEATHER_RESPONSE" | jq '.sys.sunset' )

## WIND_SPEED=$(awk "BEGIN {print 60*60*$WIND_SPEED/1000}")
# round speed to 1 kph
## WIND_SPEED=$( awk "BEGIN {print int($WIND_SPEED+0.5)}" )
## WIND_DIR=$(awk "BEGIN {print int(($WIND_DIR % 360)/22.5)}")
## DIR_ARRAY=( N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW N )
## WIND_DIR=${DIR_ARRAY[WIND_DIR]}

case $WEATHER_CONDITION in
  'Clouds')
    WEATHER_ICON=""
    ;;
  'Rain')
    WEATHER_ICON=""
    ;;
  'Snow')
    WEATHER_ICON=""
    ;;
  *)
    WEATHER_ICON=""
    ;;
esac

SUNRISE="$( date -d @$SUNRISE '+%H:%M')"
SUNSET="$( date -d @$SUNSET '+%H:%M')"
echo "${WEATHER_ICON} ${WEATHER_TEMP}°C ${WIND_SPEED}kph ${WIND_DIR}"

awk "BEGIN { if ( $WEATHER_TEMP > $ALARMING_TEMP || $WIND_SPEED > $ALARMING_WIND ) { print \"#f58312\" } }"
