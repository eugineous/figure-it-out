#!/usr/bin/env bash
# Figure it Out — One-Line Installer for Mac/Linux
# Usage: curl -fsSL https://raw.githubusercontent.com/eugineous/figure-it-out/main/install.sh | bash

set -euo pipefail

SKILL_NAME="figure-it-out.md"
SKILLS_DIR="$HOME/.claude/skills"
REPO_URL="https://raw.githubusercontent.com/eugineous/figure-it-out/master/figure-it-out.md"

echo ""
echo "  =================================================="
echo "  |           FIGURE IT OUT — INSTALLER            |"
echo "  |  The Ultimate Problem-Solving Skill for Claude |"
echo "  =================================================="
echo ""

# Create skills directory if it doesn't exist
if [ ! -d "$SKILLS_DIR" ]; then
    echo "  Creating skills directory: $SKILLS_DIR"
    mkdir -p "$SKILLS_DIR"
fi

# Download the skill
echo "  Downloading Figure it Out skill..."
if command -v curl &> /dev/null; then
    curl -fsSL "$REPO_URL" -o "$SKILLS_DIR/$SKILL_NAME"
elif command -v wget &> /dev/null; then
    wget -q "$REPO_URL" -O "$SKILLS_DIR/$SKILL_NAME"
else
    echo "  ERROR: curl or wget is required. Please install one and try again."
    exit 1
fi

# Verify installation
if [ -f "$SKILLS_DIR/$SKILL_NAME" ]; then
    LINES=$(wc -l < "$SKILLS_DIR/$SKILL_NAME")
    echo ""
    echo "  SUCCESS! Figure it Out installed ($LINES lines of pure force)"
    echo ""
    echo "  Location: $SKILLS_DIR/$SKILL_NAME"
    echo ""
    echo "  Next: Restart Claude Code and say 'figure it out'"
    echo ""
    echo "  =================================================="
    echo "  |  Stop hitting walls. Start saying 'figure it out' |"
    echo "  =================================================="
    echo ""
else
    echo "  ERROR: Installation failed. Please try manual install."
    echo "  Download figure-it-out.md and copy to $SKILLS_DIR/"
    exit 1
fi
