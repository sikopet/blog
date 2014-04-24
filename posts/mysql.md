Identify the user you are logged in as:

    SELECT USER();          # logged in as
    SELECT CURRENT_USER();  # connected as

Obtain some user info:

    SELECT host,user,password,Grant_priv,Super_priv FROM mysql.user;

Change user password:

    SET PASSWORD FOR 'debian-sys-maint'@'localhost' = PASSWORD('ThePassword');
    FLUSH PRIVILEGES;
