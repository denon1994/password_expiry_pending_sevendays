#!/bin/bash
# Created by Dinuka Nanayakkara(denon1994)(https://github.com/denon1994)

# Loop through each user on the system
for user in $(cut -d: -f1 /etc/passwd); do

  # Check if the user has a password expiry date set
  expiry_date=$(chage -l $user | grep "Password expires" | awk -F': ' '{print $2}')
  if [ "$expiry_date" == "never" ]; then
    continue
  fi

  # Convert the expiry date to seconds since epoch
  expiry_seconds=$(date -d "$expiry_date" +%s)

  # Get the current date in seconds since epoch
  now=$(date +%s)

  # Calculate the number of seconds until expiry
  seconds_until_expiry=$((expiry_seconds - now))

  # Check if the password has already expired
  if [ "$seconds_until_expiry" -le 0 ]; then
    continue
  fi

  # Check if the number of seconds until expiry is equal to 7 days (604800 seconds) or less than 7 days and greater than 6 days (518400 seconds)
  if [ "$seconds_until_expiry" -le 604800 ] && [ "$seconds_until_expiry" -ge 518401 ]; then
    echo "$user"
  fi
done
