check_crontab_func () {
#Create user list and pull each user
cat /etc/passwd | cut -d: -f1 > user_list.txt
FILE="userlist.txt"

for i in `cat user_list.txt`
do
  echo "###### $i crontab is:"
  crontab -u $i -l
  
done >> cronjobs.txt

}

check_crontab_func
