Start a mySQL Database on Docker and create an user
```
docker run --name fweRezeptBuch -e MYSQL_ROOT_PASSWORD=start01 -e MYSQL_USER=trung -e MYSQL_PASSWORD=start01 -p 3306:3306 -d mysql

```

Then connect to the database using mySQL Workbench witht the following credentials 
```
Connection Name: FWE_RezeptBuch
Hostname: 127.0.0.1
Port: 3306
Username: trung
Password: start01
```

