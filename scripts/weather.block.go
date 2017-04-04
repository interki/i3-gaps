package main

import (
	"fmt"
	"net/http"
	"encoding/json"
)

type Currently struct {
	Currently D
}
type D struct {
	Icon			string
	Temperature		float64
	Summary			string
	WindSpeed		float64
	WindBearing		int64
	Pressure		float64
}

func main() {

	//- customisation
	// api_key := "be3c5e1b5870e42570ce6dd5d23a3c13"
	// location := "-27.7175,153.2045"
	// units := "ca"

	var alarm_windy int64 = 40
	var temp_warm int64 = 30

	resp, err := http.Get("https://api.darksky.net/forecast/be3c5e1b5870e42570ce6dd5d23a3c13/-27.7175,153.2045?units=ca")
	if err != nil {
		fmt.Println(err)

	}
	var current Currently
	err = json.NewDecoder(resp.Body).Decode(&current)
	defer resp.Body.Close()
	if err != nil {
		fmt.Println(err)

	}
	icon := (current.Currently.Icon)
	temperature := int64(current.Currently.Temperature + 0.5)
	// summary := (current.Currently.Summary)
	wind_speed := int64(current.Currently.WindSpeed + 0.5)
	wind_bearing := (current.Currently.WindBearing)
	pressure := (current.Currently.Pressure - 1000)

	switch icon {
    case "clear-day":
		icon = ""
    case "clear-night":
		icon = ""
    case "rain":
		icon = ""
    case "snow":
		icon = ""
    case "sleet":
		icon = ""
    case "wind":
		icon = ""
    case "fog":
		icon = ""
    case "cloudy":
		icon = ""
    case "partly-cloudy-day":
		icon = ""
    case "partly-cloudy-night":
		icon = ""
    default:
		icon = ""
	}

	// - with summary 
	// fmt.Printf("%v %v°C %v %vkph %v° %.1f\n", icon, temperature, summary, wind_speed, wind_bearing, pressure)
	// fmt.Printf("%v %v°C %v %vkph %v° %.1f\n", icon, temperature, summary, wind_speed, wind_bearing, pressure)

	fmt.Printf("%v %v°C %vkph %v° %.1f\n", icon, temperature, wind_speed, wind_bearing, pressure)
	fmt.Printf("%v %v°C %vkph %v° %.1f\n", icon, temperature, wind_speed, wind_bearing, pressure)

	//- define colour 
	if wind_speed >= alarm_windy {
		fmt.Printf("#db2b2b")
	} else if icon == "" {
		fmt.Printf("#72cbd8")
	} else if temperature >= temp_warm {
		fmt.Printf("#f58312\n")
	}
}
