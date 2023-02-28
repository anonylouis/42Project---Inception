# Inception

This project is a quick introduction to discover how *docker* works and how to link all dockers with *docker-compose* !

The `make` command will run 8 dockers simultaneously !

- With https://localhost:4443/ you can access to a full-working wordpress site (executed with a php cgi)
- With https://localhost:4443/adminer.php you can access to the adminer php page
- With http://localhost:9998/ you can access to a page using a pythonscript (executed with a python cgi)
- With http://localhost:9999/ you can access to a static website


Use :
- `make` to run the program
- `make stop` to stop dockers
- `make clean` to remove all docker images, docker volumes, docker networks
- `make check` to check the dockers status  

![check](https://github.com/anonylouis/42Project---Inception/blob/main/check.png)

## Wordpress

Log to a standard account with :
- Login : $WP_USER1_LOGIN (from .env)
- Password : $WP_USER1_PASSWORD (from .env)

Log to an admin account with :
- Login : $WP_ADMIN_LOGIN (from .env)
- Password : $WP_ADMIN_PASSWORD (from .env)

## Mariadb

Enter in the mariadb container with :  
```docker exec -ti mariadb bash```  

Then, you can establish the database connection with the following command :  
```mysql -u $SQL_USER -p$SQL_PASSWORD $SQLDATABSE``` 

Then, use :
- `SHOW tables;` : to display all tables
- `SELECT * FROM [tablename]` : to look inside the *tablename*

## Redis cache

To check if the Redis cache is installed, use the redis-cli command inside the correct container :  
```docker exec -ti redis sh -c "redis-cli monitor"```  
Then go to wordpress, you will see cache requests.

## Adminer

On *https://localhost:4443/adminer.php*, enter this information:
- System : MySQL
- Server : mariadb
- User : $SQL_USER (from .env)
- Password : $SQL_PASSWORD (from .env)
- Datebase : $SQL_DATABASE (from .env)

## FTP server

Use ```ftp 127.0.0.1 2221``` and $FT_USER $FTP_PASSWORD to initiate the connection.  
After this you can write :
- ```get filename``` : to download the *filename*
- ```put filename``` : to upload the *filename*

**Note :** Use *cd* and *ls* to browse directories and *exit* to quit.

![ftp](https://github.com/anonylouis/42Project---Inception/blob/main/ftp.png)
