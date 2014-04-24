Identify the user you are logged in as:

    SELECT USER();          # logged in as
    SELECT CURRENT_USER();  # connected as

Obtain some user info:

    SELECT host,user,password,Grant_priv,Super_priv FROM mysql.user;
