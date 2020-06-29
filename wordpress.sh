#!/bin/bash

if ! command -v wordpress;
    then
    apt-get update
    apt-get install -y php-mysql mysql-server php7.2 libapache2-mod-php7.2 wordpress

    touch /etc/apache2/sites-available/wordpress.conf
    echo    "Alias /wordpress /usr/share/wordpress
            <Directory /usr/share/wordpress>
            Options FollowSymLinks
            AllowOverride Limit Options FileInfo
            DirectoryIndex index.php
            Order allow,deny
            Allow from all
            </Directory>
            <Directory /usr/share/wordpress/wp-content>
            Options FollowSymLinks
            Order allow,deny
            Allow from all
            </Directory>" >> /etc/apache2/sites-available/wordpress.conf

    sudo a2ensite wordpress
    sudo a2enmod rewrite
    #sudo service apache2 reload

    mysql -e "CREATE DATABASE wordpress CHARACTER SET UTF8 COLLATE UTF8_BIN;
	CREATE USER 'robbert'@'%' IDENTIFIED BY '123-Welkom-123';
	GRANT ALL PRIVILEGES ON wordpress.* TO 'robbert'@'%';
	FLUSH PRIVILEGES;"

    echo    "<?php
            define('DB_NAME', 'wordpress');
            define('DB_USER', 'robbert');
            define('DB_PASSWORD', '123-Welkom-123');
            define('DB_HOST', 'localhost');
            define('DB_COLLATE', 'utf8_general_ci');
            define('WP_CONTENT_DIR', '/usr/share/wordpress/wp-content');
            ?>" >> /etc/wordpress/config-10.0.0.72.php

    #login via localhost/wordpress/wp-login.php

    service apache2 restart
    service mysql restart
    
else
    echo "F"
fi