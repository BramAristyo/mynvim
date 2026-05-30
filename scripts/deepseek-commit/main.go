package main

import (
	"log"
	"os"
)

func main() {
	home, err := os.UserHomeDir()
	if err != nil {
		log.Fatal("failed to get home dir")
	}

	envPath := file
}
