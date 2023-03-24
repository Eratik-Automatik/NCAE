
**Change passwords**
**Set firewall rules**
**Make Backups! Of Webserver AND website content!**
**Run Hedgehog**
**Read the logs / Check History**
- ==journalctl -e== 
	- Cron, ssh, everything is routed through Systemd which is all sent to journalctl. 
- You could have a running service, but no process mapped to it! It could be sleeping under the service manager such as Systemd.

**Users and Groups**
- /etc/passwd - User information
- /etc/shadow - Password hashes
- /etc/group - Group information
- Check /etc/sudoers - visudo. 
	- Which users can become root?
	- Be mindful of ALL:(ALL) NOPASSWD. visudo to edit. 
	
**Working with users** ==DISABLE ACCOUNTS. DO NOT DELETE==
- uderadd, userdel, usermod, visduo. 
- usermod -L badguy ==Break authentication==
- usermod -s /bin/false badguy ==Break shell==

**Configuration Files
- ~/.bashrc, /etc/profile, /etc/bash.bashrc
	- bashrac - runs a script when you run bash. So check it!
- /etc/environment
	- Variables loaded into everything you run. 
- /etc/sudoers
- /etc/inputrc
	- C-Readline function. When you enter 'vim' it switches you to nano. 
- /etc/pam.d
	- Can completely break authentication

**Harden SSH**
- **USE ALLOW LISTS**
- /etc/ssh/sshd_config
	- AllowUsers user1 user2 @x.x.x.x
	- PermitRootLogin no
	- UsePAM no
- Check logs!
	- /etc/var/auth.log ?

**Parsing Log Files**
- grep
	- -A/-B # shows NUM lines before/after
	- -E enable regex
	- -v '' show everything except EXP
- Cut
- Head
	-n # 
 - Tail 
	-  -n # of lines to show
	 - -f filename constantly show this file
- journarlctl -e

**Monitoring Proccesses and Services**
- ps, pgrep, top
	- ps -eLf  
		- - e everything, -f full output, -L show threads
	- ps faux
- systemctl 
	- Systemd service management
	- systemctl list-units --type service
	- systemctl list-unit-files
- ss
	- Network information
	- ss -tlpn
		- -t tcp, -l listenting, -p process ID, -n numeric
- netstat -tlpn
- tcpdump port 53
	- Dump all DNS traffic. Are they beconing to certain URLs?

**lsof**
- List open files
- Find by process 
	- lsof -p (pid)
- Find by protocol
	- lsof -i 4
- Tracking network information
	- lsof -P | grep -ie tcp -e sock

**Common Reasons Services are Down**
- They are off
	- systemctl status service
- Blocked by firewall
- Misconfigured
	- Check /var/log
	- Understand what a good config looks like
- Still down?
	- Check logs again
	- Services again
	- journalctl 
	- You probably broke it





