install_tools_func () {

	# Added in error testing, who knows what gets borked
	# per https://www.linux.org/docs/man5/os-release.html
	# /usr/lib/os-release should be the fallback

	if . /etc/os-release ; then
	        OS=$NAME
	else
	        . /usr/lib/os-release
	        OS=$NAME
	fi

	echo "$OS installing tools"

	if [ "$OS" = "Ubuntu" ]; then
		apt -y install fail2ban tripwire clamav inotify-tools
		#echo "Ubuntu"

	elif [ "$OS" = "Kali GNU/Linux" ]; then
		apt -y install fail2ban tripwire clamav inotify-tools
		#echo "Kali"

	elif [ "$OS" = "CentOS Linux" ];then
		yum -y install fail2ban tripwire clamav inotify-tools
		#echo "CentOS"

	else 
	echo "Not Ubuntu, Debian or CentOS, install tools manually"

	fi
}

install_tools_func
