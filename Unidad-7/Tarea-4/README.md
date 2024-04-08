# Tarea 4

Una vez seguidos los pasos oficiales de MySQL para cargar tanto el esquema como los datos de la base de datos Sakila, procedemos a realizar las consultas:

```sql
source /home/jose/Escritorio/sakila-db/sakila-schema.sql;
source /home/jose/Escritorio/sakila-db/sakila-data.sql;
```
- Realiza cada una de las siguientes consultas: 

- Actores que tienen de primer nombre Scarlett.
```sql
select * from actor where first_name = "Scarlett";
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
|      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
```

- Actores que tienen de apellido Johansson.
```sql
select * from actor where last_name = "Johansson";
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
|       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
``` 

- Actores que contengan una O en su nombre.
```sql
select * from actor where first_name like '%O%' or last_name like '%o%';
+----------+-------------+--------------+---------------------+
| actor_id | first_name  | last_name    | last_update         |
+----------+-------------+--------------+---------------------+
|        1 | PENELOPE    | GUINESS      | 2006-02-15 04:34:33 |
|        5 | JOHNNY      | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        6 | BETTE       | NICHOLSON    | 2006-02-15 04:34:33 |
|        7 | GRACE       | MOSTEL       | 2006-02-15 04:34:33 |
|        8 | MATTHEW     | JOHANSSON    | 2006-02-15 04:34:33 |
|        9 | JOE         | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO        | CAGE         | 2006-02-15 04:34:33 |
|       13 | UMA         | WOOD         | 2006-02-15 04:34:33 |
|       15 | CUBA        | OLIVIER      | 2006-02-15 04:34:33 |
|       16 | FRED        | COSTNER      | 2006-02-15 04:34:33 |
|       17 | HELEN       | VOIGHT       | 2006-02-15 04:34:33 |
|       18 | DAN         | TORN         | 2006-02-15 04:34:33 |
|       19 | BOB         | FAWCETT      | 2006-02-15 04:34:33 |
|       21 | KIRSTEN     | PALTROW      | 2006-02-15 04:34:33 |
|       24 | CAMERON     | STREEP       | 2006-02-15 04:34:33 |
|       25 | KEVIN       | BLOOM        | 2006-02-15 04:34:33 |
|       26 | RIP         | CRAWFORD     | 2006-02-15 04:34:33 |
|       28 | WOODY       | HOFFMAN      | 2006-02-15 04:34:33 |
|       31 | SISSY       | SOBIESKI     | 2006-02-15 04:34:33 |
|       34 | AUDREY      | OLIVIER      | 2006-02-15 04:34:33 |
|       37 | VAL         | BOLGER       | 2006-02-15 04:34:33 |
|       38 | TOM         | MCKELLEN     | 2006-02-15 04:34:33 |
|       39 | GOLDIE      | BRODY        | 2006-02-15 04:34:33 |
|       40 | JOHNNY      | CAGE         | 2006-02-15 04:34:33 |
|       41 | JODIE       | DEGENERES    | 2006-02-15 04:34:33 |
|       42 | TOM         | MIRANDA      | 2006-02-15 04:34:33 |
|       43 | KIRK        | JOVOVICH     | 2006-02-15 04:34:33 |
|       44 | NICK        | STALLONE     | 2006-02-15 04:34:33 |
|       46 | PARKER      | GOLDBERG     | 2006-02-15 04:34:33 |
|       47 | JULIA       | BARRYMORE    | 2006-02-15 04:34:33 |
|       49 | ANNE        | CRONYN       | 2006-02-15 04:34:33 |
|       50 | NATALIE     | HOPKINS      | 2006-02-15 04:34:33 |
|       51 | GARY        | PHOENIX      | 2006-02-15 04:34:33 |
|       54 | PENELOPE    | PINKETT      | 2006-02-15 04:34:33 |
|       58 | CHRISTIAN   | AKROYD       | 2006-02-15 04:34:33 |
|       59 | DUSTIN      | TAUTOU       | 2006-02-15 04:34:33 |
|       61 | CHRISTIAN   | NEESON       | 2006-02-15 04:34:33 |
|       62 | JAYNE       | NEESON       | 2006-02-15 04:34:33 |
|       63 | CAMERON     | WRAY         | 2006-02-15 04:34:33 |
|       64 | RAY         | JOHANSSON    | 2006-02-15 04:34:33 |
|       65 | ANGELA      | HUDSON       | 2006-02-15 04:34:33 |
|       69 | KENNETH     | PALTROW      | 2006-02-15 04:34:33 |
|       70 | MICHELLE    | MCCONAUGHEY  | 2006-02-15 04:34:33 |
|       75 | BURT        | POSEY        | 2006-02-15 04:34:33 |
|       77 | CARY        | MCCONAUGHEY  | 2006-02-15 04:34:33 |
|       78 | GROUCHO     | SINATRA      | 2006-02-15 04:34:33 |
|       79 | MAE         | HOFFMAN      | 2006-02-15 04:34:33 |
|       81 | SCARLETT    | DAMON        | 2006-02-15 04:34:33 |
|       82 | WOODY       | JOLIE        | 2006-02-15 04:34:33 |
|       91 | CHRISTOPHER | BERRY        | 2006-02-15 04:34:33 |
|       92 | KIRSTEN     | AKROYD       | 2006-02-15 04:34:33 |
|       94 | KENNETH     | TORN         | 2006-02-15 04:34:33 |
|       99 | JIM         | MOSTEL       | 2006-02-15 04:34:33 |
|      102 | WALTER      | TORN         | 2006-02-15 04:34:33 |
|      104 | PENELOPE    | CRONYN       | 2006-02-15 04:34:33 |
|      105 | SIDNEY      | CROWE        | 2006-02-15 04:34:33 |
|      106 | GROUCHO     | DUNST        | 2006-02-15 04:34:33 |
|      108 | WARREN      | NOLTE        | 2006-02-15 04:34:33 |
|      111 | CAMERON     | ZELLWEGER    | 2006-02-15 04:34:33 |
|      113 | MORGAN      | HOPKINS      | 2006-02-15 04:34:33 |
|      114 | MORGAN      | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON    | BALE         | 2006-02-15 04:34:33 |
|      120 | PENELOPE    | MONROE       | 2006-02-15 04:34:33 |
|      122 | SALMA       | NOLTE        | 2006-02-15 04:34:33 |
|      125 | ALBERT      | NOLTE        | 2006-02-15 04:34:33 |
|      126 | FRANCES     | TOMEI        | 2006-02-15 04:34:33 |
|      129 | DARYL       | CRAWFORD     | 2006-02-15 04:34:33 |
|      132 | ADAM        | HOPPER       | 2006-02-15 04:34:33 |
|      134 | GENE        | HOPKINS      | 2006-02-15 04:34:33 |
|      135 | RITA        | REYNOLDS     | 2006-02-15 04:34:33 |
|      137 | MORGAN      | WILLIAMS     | 2006-02-15 04:34:33 |
|      139 | EWAN        | GOODING      | 2006-02-15 04:34:33 |
|      140 | WHOOPI      | HURT         | 2006-02-15 04:34:33 |
|      144 | ANGELA      | WITHERSPOON  | 2006-02-15 04:34:33 |
|      146 | ALBERT      | JOHANSSON    | 2006-02-15 04:34:33 |
|      150 | JAYNE       | NOLTE        | 2006-02-15 04:34:33 |
|      151 | GEOFFREY    | HESTON       | 2006-02-15 04:34:33 |
|      154 | MERYL       | GIBSON       | 2006-02-15 04:34:33 |
|      156 | FAY         | WOOD         | 2006-02-15 04:34:33 |
|      159 | LAURA       | BRODY        | 2006-02-15 04:34:33 |
|      161 | HARVEY      | HOPE         | 2006-02-15 04:34:33 |
|      162 | OPRAH       | KILMER       | 2006-02-15 04:34:33 |
|      163 | CHRISTOPHER | WEST         | 2006-02-15 04:34:33 |
|      167 | LAURENCE    | BULLOCK      | 2006-02-15 04:34:33 |
|      168 | WILL        | WILSON       | 2006-02-15 04:34:33 |
|      169 | KENNETH     | HOFFMAN      | 2006-02-15 04:34:33 |
|      170 | MENA        | HOPPER       | 2006-02-15 04:34:33 |
|      171 | OLYMPIA     | PFEIFFER     | 2006-02-15 04:34:33 |
|      172 | GROUCHO     | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON         | CHASE        | 2006-02-15 04:34:33 |
|      178 | LISA        | MONROE       | 2006-02-15 04:34:33 |
|      180 | JEFF        | SILVERSTONE  | 2006-02-15 04:34:33 |
|      182 | DEBBIE      | AKROYD       | 2006-02-15 04:34:33 |
|      183 | RUSSELL     | CLOSE        | 2006-02-15 04:34:33 |
|      185 | MICHAEL     | BOLGER       | 2006-02-15 04:34:33 |
|      188 | ROCK        | DUKAKIS      | 2006-02-15 04:34:33 |
|      191 | GREGORY     | GOODING      | 2006-02-15 04:34:33 |
|      192 | JOHN        | SUVARI       | 2006-02-15 04:34:33 |
|      195 | JAYNE       | SILVERSTONE  | 2006-02-15 04:34:33 |
|      200 | THORA       | TEMPLE       | 2006-02-15 04:34:33 |
+----------+-------------+--------------+---------------------+
```

- Actores que contengan una O en su nombre y en una A en suapellido.

```sql
select * from actor where first_name like '%O%' and last_name like '%A%';
+----------+------------+--------------+---------------------+
| actor_id | first_name | last_name    | last_update         |
+----------+------------+--------------+---------------------+
|        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
|       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
|       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
|       42 | TOM        | MIRANDA      | 2006-02-15 04:34:33 |
|       63 | CAMERON    | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA      | 2006-02-15 04:34:33 |
|      114 | MORGAN     | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON   | BALE         | 2006-02-15 04:34:33 |
|      137 | MORGAN     | WILLIAMS     | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON        | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK       | DUKAKIS      | 2006-02-15 04:34:33 |
|      192 | JOHN       | SUVARI       | 2006-02-15 04:34:33 |
+----------+------------+--------------+---------------------+
```
- Actores que contengan dos O en su nombre y en una A en suapellido.
- Actores donde su tercera letra sea B.
- Ciudades que empiezan por a.
- Ciudades que acaban por s.
- Ciudades del country 61.
- Ciudades del country Spain.
- Ciudades con nombres compuestos.
- Películas con una duración entre 80 y 100.
- Peliculas con un rental_rate entre 1 y 3.
- Películas con un titulo de más de 12 letras.
- Peliculas con un rating de PG o G.
- Peliculas que no tengan un rating de NC-17.
- Peliculas con un rating PG y duracion de más de 120.
- ¿Cuantos actores hay?
- ¿Cuántas ciudades tiene el country Spain?
- ¿Cuántos countries hay que empiezan por a?
- Media de duración de peliculas con PG.
- Suma de rental_rate de todas las peliculas.
- Pelicula con mayor duración.
- Película con menor duración.
- Mostrar las ciudades del country Spain (multitabla).
- Mostrar el nombre de la película y el nombre de los actores.
- Mostrar el nombre de la película y el de sus categorías.
- Mostrar el country, la ciudad y dirección de cada miembro delstaff.
- Mostrar el country, la ciudad y dirección de cada customer.
- Numero de películas de cada rating
- Cuantas películas ha realizado el actor ED CHASE.
- Media de duración de las películas cada categoría.