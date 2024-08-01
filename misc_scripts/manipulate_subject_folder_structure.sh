#!/bin/bash

# Navigate to the parent directory containing d1:d28 and h1:h14 subdirectories
cd /Volumes/BTCruiser/LGNW/data

# Loop through d1 to d28 directories
for i in {1..28}; do
  # Check if the directory exists
  if [ -d "d$i/stats" ]; then
    # Create the mvpa_1stlvl directory if it doesn't exist
    #mkdir -p "d$i/stats/mvpa_1stlvl"
    # Check if the mvpa_1stlvl directory exists
    if [ -d "d$i/stats/mvpa_1stlvl" ]; then
      # Rename the mvpa_1stlvl directory to uni_1stlvl
      mv "d$i/stats/mvpa_1stlvl" "d$i/stats/uni_1stlvl"
    fi
  else
    echo "Directory d$i/stats does not exist."
  fi
done

# Loop through h1 to h14 directories
for i in {1..14}; do
  # Check if the directory exists
  if [ -d "h$i/stats" ]; then
    # Create the mvpa_1stlvl directory if it doesn't exist
    #mkdir -p "h$i/stats/mvpa_1stlvl"
    # Check if the mvpa_1stlvl directory exists
    if [ -d "h$i/stats/mvpa_1stlvl" ]; then
      # Rename the mvpa_1stlvl directory to uni_1stlvl
      mv "h$i/stats/mvpa_1stlvl" "h$i/stats/uni_1stlvl"
    fi
  else
    echo "Directory h$i/stats does not exist."
  fi
done
