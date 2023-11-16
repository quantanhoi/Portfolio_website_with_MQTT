Start a mySQL Database on Docker and create an user
```
docker run --name fweRezeptBuch -e MYSQL_ROOT_PASSWORD=start01 -e MYSQL_USER=trung -e MYSQL_PASSWORD=start01 -p 3306:3306 -d mysql

```

Then connect to the database using mySQL Workbench witht the following credentials 
```
Connection Name: FWE_RezeptBuch
Hostname: 127.0.0.1
Port: 3306
Username: root
Password: start01
```

Grant Privileges to user
```
GRANT ALL PRIVILEGES ON *.* TO 'trung'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```
Now you can actually use user trung to create database
```
CREATE DATABASE fwe_rezeptBuch;
```

Then use the database
```
USE fwe_rezeptBuch
```

now you can paste the whole sql script to create the schemas
Example of getting Ingredient Name, Beschreibung, Amount and Unit from a specific Recipe
```
select z.name, z.Beschreibung, ia.amount, ia.unit  from Zutat z 
join Ingredient_Amount ia on z.I_ID = ia.I_ID 
join Rezept r on r.R_ID = ia.R_ID
where r.Name = 'Chicken Fried Rice';
```

example of getting the recipe with specific kategorie and recipe name
```
select k.name, r.name, r.beschreibung 
from Kategorie k
join Kategorie_Rezept kr
on k.name = kr.name
join Rezept r 
on r.r_id = kr.r_id
where k.name = 'Beverages' and r.name = 'Matcha Latte';
```


Let's start with create API
```
npm init -y
npm install @mikro-orm/cli @mikro-orm/core @mikro-orm/mysql @mikro-orm/nestjs express typescript ts-node
```


