package main

import (
	"fmt"
	"net/http"
	"encoding/json"
)


type Currency struct {
	Last float64 `json:"last"`
}

type CurrencyList struct{
	AUD Currency `json:"AUD"`
}

func main() {

	resp, err := http.Get("https://blockchain.info/ticker")
	if err != nil {
		fmt.Println(err)
	}

	var priceList CurrencyList
	err = json.NewDecoder(resp.Body).Decode(&priceList)
	defer resp.Body.Close()
	if err != nil {
		fmt.Println(err)
	}

	last := int64(priceList.AUD.Last + 0.5)
	fmt.Printf(":%v\n", last)
}