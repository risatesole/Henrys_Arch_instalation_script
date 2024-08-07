#!/bin/bash

welcome(){
    clear
    cat assets/ascii_art/ascii_patern01.txt
    cat assets/ascii_art/ascii_patern01.txt

    echo "welcome Henry's Instalation script"

    cat assets/ascii_art/ascii_patern01.txt
    cat assets/ascii_art/ascii_patern01.txt
    echo "Fake progressbar: "
    percentagebar_loop
}


# percent bar
total=40      # Total length of the charging line (number of #)
delay=0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001     # Delay between updates (in seconds)
progress_bar() {
  local progress=$1
  local percentage=$(( (progress * 100) / total ))
  local filled=$(printf "%${progress}s" | tr ' ' '#')
  local empty=$(printf "%$((total - progress))s" | tr ' ' ' ')

  # Print the progress bar
  echo -ne "\r[${filled}${empty}] ${percentage}%"
}

# Main loop
percentagebar_loop(){
for i in $(seq 0 $total); do
  progress_bar $i
  sleep $delay
done

# Complete line
echo -ne "\rCharging: [$(printf "%${total}s" | tr ' ' '#')] Complete!\n"
}