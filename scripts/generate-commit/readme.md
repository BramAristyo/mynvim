# AI Commit (Linux Only)

A lightweight Go script to generate Conventional Commit messages using the Gemini API and `git diff --staged`.

## Prerequisites
- Go installed
- `lazygit`
- Gemini API Key

## Installation

1. Navigate to the script directory:
```bash
cd ~/.config/nvim/scripts/generate-commit/
```

2. Setup environment variables:
```bash
cp .env.example .env
```
*Note: Open `.env` and fill in your `GEMINI_API_KEY` and `PROMPT_PATH`.*

3. Build and install the binary to your local bin:
```bash
go build -o aicommit main.go
mv aicommit ~/.local/bin/
```

## LazyGit Integration

Add this custom command to your `~/.config/lazygit/config.yml`:

```yaml
customCommands:
  - key: '<c-g>'
    context: 'files'
    subprocess: true
    command: |
      MSG=$(aicommit)
      printf "\n%s\n\n" "$MSG"
      printf "Commit this message? (y/n): "
      read ans
      if [ "$ans" = "y" ] || [ "$ans" = "Y" ]; then
        git commit -m "$MSG"
        printf "\n✅ Successfully committed!\n"
      else
        printf "\n❌ Commit aborted.\n"
      fi
```

## Usage
1. Stage your files in LazyGit using `Space` or `a`.
2. Press `Ctrl + g`.
3. Review the generated message, type `y` to commit, or `n` to abort.
