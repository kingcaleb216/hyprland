#!/bin/bash

if [[ -z $1 ]]
then
    echo "No ascii file given"
    exit
fi

# File containing ASCII art
FILE=$(dirname $(realpath $0))/$1

# Read the file into an array
mapfile -t lines < "$FILE"
num_lines=${#lines[@]}

# Function to restore cursor and exit
cleanup() {
    tput cnorm    # Show the cursor again
    tput sgr0     # Reset text formatting
    clear
    exit
}

# Trap Ctrl+C (SIGINT) to clean up
trap cleanup INT

# Hide cursor
tput civis

# Infinite loop
while true; do
    clear

    # Create an array of line numbers
    line_indices=($(seq 0 $((num_lines - 1))))

    # Shuffle line indices
    shuffled=($(shuf -e "${line_indices[@]}"))

    lineCount=$(wc -l < "$FILE")
    waitTime=$(echo "scale=1; (10 / $lineCount) + .5" | bc)

    # Draw each line in randomized order but correct position
    for idx in "${shuffled[@]}"; do
        tput cup $idx 0
        printf "%s" "${lines[$idx]}"
        sleep $waitTime
    done

    sleep 5
done

