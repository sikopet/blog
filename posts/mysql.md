General
-------

Login to mysql server:

    mysql --defaults-file=/etc/mysql/debian.cnf
    
Show processes:

    SHOW PROCESSLIST;

Identify the user you are logged in as:

    SELECT USER();          # logged in as
    SELECT CURRENT_USER();  # connected as

Obtain some user info:

    SELECT host,user,password,Grant_priv,Super_priv FROM mysql.user;

Change user password:

    SET PASSWORD FOR 'debian-sys-maint'@'localhost' = PASSWORD('ThePassword');
    FLUSH PRIVILEGES;

Grant privileges for user:

    GRANT SELECT ON bacula.* TO 'bakstat'@'1.2.3.4' IDENTIFIED BY 'ThePassword';
    
Show grants for user:

    SHOW GRANTS FOR 'bakstat'@'1.2.3.4';
    
Replication
-----------

Master/slave status:

    SHOW MASTER STATUS\G
    SHOW SLAVE STATUS\G

More

* MySQL High Availability
 * Chapter 3. MySQL Replication Fundamentals 
