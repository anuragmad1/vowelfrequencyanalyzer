
#!/bin/bash
set -e

# Inputs
FREQ_RESULT="$1"
GITHUB_USER="$2"
TIMESTAMP=$(date)

# Update README
printf '\n%s - %s - %s\n' "$GITHUB_USER" "$FREQ_RESULT" "$TIMESTAMP" >> README.md

# Configure Git to use GitHub Actions user and email
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

# Add README.md to git, commit, and push the changes
git add README.md
git commit -m "Update README with vowel frequency results" || echo "No changes to commit"
git push origin HEAD:main
