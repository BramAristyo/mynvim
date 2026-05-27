package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/joho/godotenv"
)

type Part struct {
	Text string `json:"text"`
}

type Content struct {
	Parts []Part `json:"parts"`
}

type GeminiRequest struct {
	Contents []Content `json:"contents"`
}

type ResponseContent struct {
	Parts []Part `json:"parts"`
}

type Candidate struct {
	Content ResponseContent `json:"content"`
}

type GeminiResponse struct {
	Candidates []Candidate `json:"candidates"`
}

func main() {
	home, err := os.UserHomeDir()
	if err != nil {
		log.Fatal("Failed to get home dir")
	}

	envPath := filepath.Join(home, ".config/nvim/scripts/generate-commit/.env")
	err = godotenv.Load(envPath)
	if err != nil {
		log.Fatalf("Error load .env file di: %s", envPath)
	}

	apiKey := os.Getenv("GEMINI_API_KEY")
	if apiKey == "" {
		log.Fatal("GEMINI_API_KEY is empty")
	}

	textPath := os.Getenv("PROMPT_PATH")
	if textPath == "" {
		log.Fatal("PROMPT_PATH is empty")
	}

	cmd := exec.Command("git", "diff", "--staged")
	diff, err := cmd.Output()
	if err != nil || len(diff) == 0 {
		log.Fatal("No staged changes found. Use 'git add' first!")
	}

	promptPath := filepath.Join(home, textPath)
	promptBytes, err := os.ReadFile(promptPath)
	if err != nil {
		log.Fatalf("Failed while read .txt file di: %s", promptPath)
	}

	prompt := fmt.Sprintf(string(promptBytes), string(diff))

	reqBody := GeminiRequest{
		Contents: []Content{{Parts: []Part{{Text: prompt}}}},
	}

	jsonBody, err := json.Marshal(reqBody)
	if err != nil {
		log.Fatal("Failed to marshal request payload")
	}

	url := "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash:generateContent"

	req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonBody))
	if err != nil {
		log.Fatal("Failed to create HTTP request")
	}

	req.Header.Set("x-goog-api-key", apiKey)
	req.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		log.Fatalf("API request failed: %v", err)
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Fatal("Failed to read API response")
	}

	var geminiResp GeminiResponse
	if err := json.Unmarshal(body, &geminiResp); err != nil {
		log.Fatalf("Failed to parse JSON response: %v\nRaw Body: %s", err, string(body))
	}

	if len(geminiResp.Candidates) > 0 && len(geminiResp.Candidates[0].Content.Parts) > 0 {
		fmt.Print(geminiResp.Candidates[0].Content.Parts[0].Text)
	} else {
		log.Fatal("AI returned empty response or invalid format: ", string(body))
	}
}
