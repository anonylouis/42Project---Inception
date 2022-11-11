# Inception

## FTP server

Use ```ftp 127.0.0.1``` and $FT_USER $FTP_PASSWORD to initiate the connection.  
After this you can write :
- ```get filename``` : to download the *filename*
- ```put filename``` : to upload the *filename*

**Note :** Use *cd* and *ls* to browse directories and *exit* to quit.

## Adminer

Go on *https://lcalvie42.fr/adminer.php* and  enter this information:
- System : MySQL
- Server : mariadb
- User : $SQL_USER
- Password : $SQL_PASSWORD
- Datebase : $SQL_DATABASE

## Mariadb

Find the IPAddress of the docker container mariadb with :  
```docker container inspect mariadb | grep IPAdress```  

Then, you can establish the database connection with the following command :  
```mysql -h IPAddress -u $SQL_USER -p$SQL_PASSWORD $SQLDATABSE```

Use :
- `SHOW tables;` : to display all tables
- `SELECT * FROM [tablename]` : to look inside the *tablename*

## Redis cache

To check if the Redis cache is installed, use the redis-cli command inside the correct container :  
```docker exec -ti redis sh -c "redis-cli monitor"```  
Then go to wordpress, you will see cache requests.

