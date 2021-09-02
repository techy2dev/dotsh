

#!/bin/bash
apt-get update

add-apt-repository -y ppa:certbot/certbot
apt-get update
apt-get -y install certbot

 cp -r live  /etc/letsencrypt/







clear
radius=$(/etc/init.d/freeradius status | grep running | grep -v not | wc -l);
if [ "$radius" -ne 1 ];
then
sudo add-apt-repository ppa:freeradius/stable-2.x
apt-get -y install freeradius freeradius-mysql
cp default /etc/freeradius/3.0/sites-enabled/default

fi

UP=$(/etc/init.d/mysql status | grep running | grep -v not | wc -l);
if [ "$UP" -ne 1 ];
then

	while true; do
		DB=$(whiptail --inputbox "\nDatabase name:" 9 66 vpn --title "VPN configuration in mysql-server" --nocancel 3>&1 1>&2 2>&3)
		if [ -z "$DB" ]; then
			whiptail --title "VPN configuration de mysql-server" --msgbox "\nYou must enter a valid name try again." 9 66
		else
			break
		fi
	done

	

	#clear
	echo "mysql-server mysql-server/root_password select rootroot" | debconf-set-selections
	echo "mysql-server mysql-server/root_password_again select rootroot" | debconf-set-selections
	apt-get -y install mysql-server
	echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/app-password-confirm password rootroot" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/mysql/admin-pass password rootroot" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/mysql/app-pass password rootroot" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
	apt-get install -y phpmyadmin

	#clear
	echo "\configuration database..."
	USERBD="$(tr -dc a-z0-9 < /dev/urandom | head -c 6 | xargs)"
	PASSBD="$(tr -dc a-z0-9 < /dev/urandom | head -c 15 | xargs)"
	mysql -u root -prootroot -e "DROP DATABASE IF EXISTS vpn;"
	mysql -u root -prootroot -e "CREATE DATABASE vpn /*\!40100 DEFAULT CHARACTER SET utf8 */;"
	mysql -u root -prootroot -e "CREATE USER root@localhost IDENTIFIED BY 'rootroot';"
	mysql -u root -prootroot -e "GRANT ALL PRIVILEGES ON vpn.* TO 'rootroot'@'localhost';"
	mysql -u root -prootroot -e "FLUSH PRIVILEGES;"
	mysql --user=root --password=rootroot --host=localhost vpn < vpn.sql
	echo "Database"

	echo "PASS"

fi

cp servers /etc/radcli/
 apt-get -y install ufw
sudo ufw allow 22/tcp
cp ufw /etc/default/ufw
cp before.rules /etc/ufw/before.rules
cp ufw /etc/default/ufw

ufw allow ssh

sudo ufw allow 443/tcp
sudo ufw allow 443/udp
sudo ufw allow 3306
iptables -t nat -L POSTROUTING





sudo ufw   enable


apt-get -y install ocserv
cd
mkdir /temp
cp ocserv/temp/* /temp/
chmod -R 777 /temp/
cp ocserv/ocserv.conf  /etc/ocserv/

sed -i "s/#net.ipv4.ip_forward=1/net.ipv4.ip_forward = 1/g" /etc/sysctl.conf
sed -i "s/#localhost/localhost/g" /etc/radcli/servers

sudo sysctl -p

sudo /etc/init.d/ocserv restart
sudo /etc/init.d/freeradius restart




















