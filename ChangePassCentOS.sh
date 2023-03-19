#!/bin/bash

# Create a list of users
cat /etc/passwd | cut -d: -f1 > user_list.txt

# List of Admin accounts
users=("root")

# Loop through each user and change their password
while IFS= read -r user
do
    if [[ " ${users[@]} " =~ " $user " ]]
    then
        "Cannot change admin password"
    else
        PASS=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 31)
        #PASS=NighOwTes1!
        echo "Changing password for $user"
        echo "$user,$PASS" >> userlist.txt
        echo -e "$PASS\n$PASS" | passwd "$user"
    fi
done < user_list.txt

