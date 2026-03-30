#!/bin/bash

# Script 5: Enhanced Open Source Manifesto Generator
# Author: Vineet Salve

echo "========================================"
echo "     Open Source Manifesto Generator"
echo "========================================"
echo ""

# --- User Input ---
read -p "1. Your name: " NAME
read -p "2. Favorite open-source tool: " TOOL
read -p "3. One word for freedom: " FREEDOM
read -p "4. What will you build and share?: " BUILD

# --- Variables ---
DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# --- Generate manifesto ---
echo "Generating your personalized manifesto..."
echo ""

echo "========================================" > $OUTPUT
echo "        OPEN SOURCE MANIFESTO" >> $OUTPUT
echo "========================================" >> $OUTPUT
echo "Name: $NAME" >> $OUTPUT
echo "Date: $DATE" >> $OUTPUT
echo "" >> $OUTPUT

echo "I, $NAME, believe that technology should be open, accessible, and collaborative." >> $OUTPUT
echo "Through tools like $TOOL, I experience true $FREEDOM in the digital world." >> $OUTPUT
echo "I commit to building $BUILD and sharing it freely with others." >> $OUTPUT
echo "Open source is not just code — it is a movement of knowledge, trust, and innovation." >> $OUTPUT
echo "Together, we grow stronger by learning, sharing, and improving collectively." >> $OUTPUT

echo "" >> $OUTPUT
echo "----------------------------------------" >> $OUTPUT
echo "Generated on $DATE" >> $OUTPUT

# --- Display ---
echo "Manifesto saved to: $OUTPUT"
echo ""
echo "Your Manifesto:"
echo "----------------------------------------"

cat $OUTPUT
