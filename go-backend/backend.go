package main

import (
	"github.com/PuSuEngine/gopusu"
	"gopkg.in/yaml.v2"
	"log"
	"io/ioutil"
	"fmt"
	"time"
)

type Settings struct {
	PusudHost string		`yaml:"pusud_host"`
	PusudPort int		`yaml:"pusud_port"`
}

func loadSettings() *Settings {
	s := Settings{}

	data, err := ioutil.ReadFile("settings.yaml")

	if err != nil {
		log.Fatalf("error: %v", err)
	}

	yaml.Unmarshal(data, &s)

	return &s
}

func main() {
	s := loadSettings()
	pc, err := gopusu.NewClient(s.PusudHost, s.PusudPort)

	if err != nil {
		log.Fatalf("error: %v", err)
	}

	defer pc.Close()
	pc.Authorize("")

	for {
		ts := fmt.Sprintf("%d", time.Now().UnixNano())
		pc.Publish("time.go", ts)
		fmt.Printf("Tick... %s\n", ts)
		time.Sleep(time.Millisecond * 25)
	}
}
