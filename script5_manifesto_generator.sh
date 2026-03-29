#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Vaidehi Dadheech | Course: Open Source Software
# Purpose: Asks the user 3 questions interactively and
#          generates a personalised open-source philosophy
#          statement, saving it to a .txt file.

# --- alias concept demonstration (comment form) ---
# alias today='date +%d\ %B\ %Y'  <-- this is what an alias looks like
# We use the date command directly below for the same result

echo "========================================"
echo "  OSS Manifesto Generator"
echo "  Author: Vaidehi Dadheech"
echo "========================================"
echo ""
echo "Answer three questions to generate your"
echo "personal open-source philosophy statement."
echo ""

# --- Interactive input using read -p ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Gather context ---
DATE=$(date '+%d %B %Y')
AUTHOR=$(whoami)
OUTPUT="manifesto_${AUTHOR}.txt"

# --- Write manifesto to file using > and >> ---
echo "========================================" >  "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO"             >> "$OUTPUT"
echo "  Author : Vaidehi Dadheech"            >> "$OUTPUT"
echo "  User   : $AUTHOR"                     >> "$OUTPUT"
echo "  Date   : $DATE"                       >> "$OUTPUT"
echo "  Software Audited: Linux Kernel (GPL v2)" >> "$OUTPUT"
echo "========================================"  >> "$OUTPUT"
echo ""                                          >> "$OUTPUT"

# --- Compose paragraph using string concatenation ---
echo "Every day, I rely on $TOOL — a piece of software"     >> "$OUTPUT"
echo "that someone built, shared, and refused to lock away." >> "$OUTPUT"
echo "To me, freedom means $FREEDOM."                        >> "$OUTPUT"
echo "That single word is why the Linux Kernel exists."      >> "$OUTPUT"
echo ""                                                       >> "$OUTPUT"
echo "In 1991, Linus Torvalds did not have to share his"     >> "$OUTPUT"
echo "work. He chose to — and in doing so, he gave the"      >> "$OUTPUT"
echo "world a foundation that powers billions of devices."   >> "$OUTPUT"
echo ""                                                       >> "$OUTPUT"
echo "I believe in that same spirit. One day I want to"      >> "$OUTPUT"
echo "build $BUILD — and I will share it freely, the way"   >> "$OUTPUT"
echo "the kernel was shared with the world."                 >> "$OUTPUT"
echo "Because open source is not just a licence."            >> "$OUTPUT"
echo "It is a promise: knowledge belongs to everyone."       >> "$OUTPUT"
echo ""                                                       >> "$OUTPUT"
echo "========================================"  >> "$OUTPUT"
echo "  Signed: Vaidehi Dadheech  |  $DATE"     >> "$OUTPUT"
echo "========================================"  >> "$OUTPUT"

# --- Display the saved manifesto ---
echo ""
echo "[Saved] Manifesto written to: $OUTPUT"
echo ""
cat "$OUTPUT"
