list_users_func () {
    cat /etc/passwd | cut -d: -f1 > user_list.txt
}

change_passwords_func() {
    root_user="root"
    current_user="default"
    echo $current_user
    echo $root_user
    FILE="userlist.txt"
    for i in `cat user_list.txt`
    do
   	 #if [ "$i" = "test" ]  
   	 if [ "$i" != "$current_user" ] && [ "$i" != "$root_user" ]
   	 then
   		 #echo "test = $i"
   	     PASS=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 31)_
   		 #PASS=nightowl1
   		 echo "Changing password for $i"
   		 #checking if username is already in file and if so, editing the current entry.
   		 #else creating new entry
   		 if grep -q "$i" "$FILE"
   		 then
   			 sed -i "s/^.*$i.*$/$i,$PASS/" "$FILE"
   		 else
   			 echo "$i,$PASS" >> userlist.txt
   		 fi
   		 #changing password and confirming completiong
   		 echo "$PASS\n$PASS" | passwd $i
   		 echo "password change for $i completed"
   	 else
   		 echo "Cannot change password for $current_user or $root_user"
   	 fi
    done
}

change_passwords(){
    list_users_func
    change_passwords_func
}

change_passwords

clean_up_func(){
    sudo rm userlist.txt
    sudo rm user_list.txt
    sudo rm ChangePassKali.sh
}


clean_up_func
