#!/bin/env bash


enumerate_func(){
	#enumerate system
	date -u  >> sysinfo.txt
	uname -a >> sysinfo.txt

	# /usr/lib/os-release should be the fallback

	if . /etc/os-release ; then
		OS=$NAME
	else
		. /usr/lib/os-release
	    OS=$NAME
	fi
	
	echo "OS is $ID" >> sysinfo.txt
	lscpu    >> sysinfo.txt
	lsblk    >> sysinfo.txt
	ip a     >> sysinfo.txt
	sudo netstat -auntp >>sysinfo.txt
	df       >> sysinfo.txt
	sudo ls -latr /var/log/* >> sysinfo.txt
	sudo ls -la /etc/rsyslog.conf >> sysinfo.txt
	cat /etc/crontab >> sysinfo.txt
	ls -la /etc/cron.* >> sysinfo.txt
	sestatus >> sysinfo.txt
	getenforce >> sysinfo.txt
	sudo cat /root/.bash_history >> sysinfo.txt
	cat ~/.bash_history >> sysinfo.txt
	cat /etc/group >> sysinfo.txt
	cat /etc/passwd >> sysinfo.txt

}

enumerate_func
