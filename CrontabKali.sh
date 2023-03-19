check_crontab_func () {
#Create user list and pull each user
touch cronjobs.txt
sudo chmod 777 cronjobs.txt

cat /etc/passwd | cut -d: -f1 > user_list.txt
FILE="userlist.txt"


sudo chmod 777 cronjobs.txt

for i in `cat user_list.txt`
do
  echo "###### $i crontab is:"
  crontab -u $i -l
  
done >> cronjobs.txt

}

check_crontab_func
