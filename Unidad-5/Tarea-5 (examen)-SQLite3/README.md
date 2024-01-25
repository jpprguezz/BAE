# Tarea 5 (examen)
```sql
/**
Actualizar el nivel de Bulbasaur
**/
update Pokemon set nivel=30 where nombre='Bulbasaur';
/**
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 30    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/


/**
Incrementar el nivel de todos los Pokémon de tipo Agua.
**/
update Pokemon as p set nivel = nivel + 1 from tipo as t where t.nombre='Agua' and p.id_tipo=t.id;
/**
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 10    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 9     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 26    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 31    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 56    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
/**

**/
Eliminar a Jynx de la lista de Pokémon.
/**
delete from Pokemon where nombre='Jynx';
/**
No existe el Pokemon Jynx
**/


/**
Eliminar el tipo "Hielo" de la lista de tipos de Pokémon.
**/
delete from Pokemon where tipo='Hielo'
/**
No existe Pokemons tipo Hielo
**/

/**
Obtener todos los Pokémon.
**/
select * from Pokemon;
/**
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 10    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 9     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 26    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 31    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 56    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

/**
Obtener el nombre y nivel de los Pokémon de tipo Fuego.
**/
select p.nombre, p.nivel from Pokemon as p, tipo as t where t.nombre='Fuego' and t.id=p.id_tipo;
/**
┌────────────┬───────┐
│   nombre   │ nivel │
├────────────┼───────┤
│ Charmander │ 12    │
│ Flareon    │ 27    │
│ Arcanine   │ 35    │
│ Charizard  │ 50    │
│ Dragonite  │ 60    │
│ Flareon    │ 65    │
└────────────┴───────┘


/**
Obtener el nombre de los Pokémon que tienen un nivel superior a 30.
**/
select * from pokemon where nivel > 30;
/**
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 11 │ Gyarados   │ 1       │ 31    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 56    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/


/**
Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.
**/
select * from pokemon order by nivel desc;
/**
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 25 │ Rhydon     │ 5       │ 80    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 18 │ Blastoise  │ 1       │ 56    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 11 │ Gyarados   │ 1       │ 31    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 6  │ Vaporeon   │ 1       │ 26    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 2  │ Charmander │ 2       │ 12    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 1  │ Bulbasaur  │ 3       │ 10    │
│ 3  │ Squirtle   │ 1       │ 9     │
└────┴────────────┴─────────┴───────┘
**/

/**
Obtener la cantidad de Pokémon por tipo.
/**
elect t.nombre, count(id_tipo) as 'Total tipos' from Pokemon as p, tipo as t where t.id=p.id_tipo group by p.id_tipo;
**/
┌───────────┬─────────────┐
│  nombre   │ Total tipos │
├───────────┼─────────────┤
│ Agua      │ 4           │
│ Fuego     │ 6           │
│ Planta    │ 5           │
│ Eléctrico │ 5           │
│ Tierra    │ 5           │
└───────────┴─────────────┘
**/

/**
Obtener la información completa de un Pokémon específico. Selecciona el que desees.
**/
select id, nombre, id_tipo, nivel from Pokemon where nombre='Raichu';
┌────┬────────┬─────────┬───────┐
│ id │ nombre │ id_tipo │ nivel │
├────┼────────┼─────────┼───────┤
│ 14 │ Raichu │ 4       │ 38    │
└────┴────────┴─────────┴───────┘
/**

**/
Obtener el promedio de niveles de todos los Pokémon.
/**
select avg(nivel) from Pokemon;
**/
┌────────────┐
│ avg(nivel) │
├────────────┤
│ 37.68      │
└────────────┘

/**
Obtener el nombre del Pokémon de mayor nivel.
**/
select nombre from Pokemon order by nivel desc limit 1; 
/**
┌────────┐
│ nombre │
├────────┤
│ Rhydon │
└────────┘
**/

/**
update Pokemon set nombre='Bulbasaur Nv.15' where nombre='Bulbasaur';
**/
┌────┬──────────────────┬─────────┬───────┐
│ id │      nombre      │ id_tipo │ nivel │
├────┼──────────────────┼─────────┼───────┤
│ 1  │ Bulbasaur Nv. 15 │ 3       │ 10    │
│ 2  │ Charmander       │ 2       │ 12    │
│ 3  │ Squirtle         │ 1       │ 9     │
│ 4  │ Pikachu          │ 4       │ 15    │
│ 5  │ Geodude          │ 5       │ 11    │
│ 6  │ Vaporeon         │ 1       │ 26    │
│ 7  │ Flareon          │ 2       │ 27    │
│ 8  │ Ivysaur          │ 3       │ 18    │
│ 9  │ Jolteon          │ 4       │ 22    │
│ 10 │ Cubone           │ 5       │ 14    │
│ 11 │ Gyarados         │ 1       │ 31    │
│ 12 │ Arcanine         │ 2       │ 35    │
│ 13 │ Exeggutor        │ 3       │ 40    │
│ 14 │ Raichu           │ 4       │ 38    │
│ 15 │ Sandslash        │ 5       │ 33    │
│ 16 │ Venusaur         │ 3       │ 45    │
│ 17 │ Charizard        │ 2       │ 50    │
│ 18 │ Blastoise        │ 1       │ 56    │
│ 19 │ Electabuzz       │ 4       │ 48    │
│ 20 │ Rhydon           │ 5       │ 52    │
│ 21 │ Dragonite        │ 2       │ 60    │
│ 22 │ Flareon          │ 2       │ 65    │
│ 23 │ Venusaur         │ 3       │ 70    │
│ 24 │ Zapdos           │ 4       │ 75    │
│ 25 │ Rhydon           │ 5       │ 80    │
└────┴──────────────────┴─────────┴───────┘
/**

**/
Obtener los Pokémon cuyo nivel es igual a 50.
/**
select * from Pokemon where nivel=50;
**/
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 17 │ Charizard │ 2       │ 50    │
└────┴───────────┴─────────┴───────┘
/**


**/
Eliminar todos los Pokémon de nivel 40.
/**
delete from Pokemon where nivel=40;
**/
┌────┬──────────────────┬─────────┬───────┐
│ id │      nombre      │ id_tipo │ nivel │
├────┼──────────────────┼─────────┼───────┤
│ 1  │ Bulbasaur Nv. 15 │ 3       │ 10    │
│ 2  │ Charmander       │ 2       │ 12    │
│ 3  │ Squirtle         │ 1       │ 9     │
│ 4  │ Pikachu          │ 4       │ 15    │
│ 5  │ Geodude          │ 5       │ 11    │
│ 6  │ Vaporeon         │ 1       │ 26    │
│ 7  │ Flareon          │ 2       │ 27    │
│ 8  │ Ivysaur          │ 3       │ 18    │
│ 9  │ Jolteon          │ 4       │ 22    │
│ 10 │ Cubone           │ 5       │ 14    │
│ 11 │ Gyarados         │ 1       │ 31    │
│ 12 │ Arcanine         │ 2       │ 35    │
│ 14 │ Raichu           │ 4       │ 38    │
│ 15 │ Sandslash        │ 5       │ 33    │
│ 16 │ Venusaur         │ 3       │ 45    │
│ 17 │ Charizard        │ 2       │ 50    │
│ 18 │ Blastoise        │ 1       │ 56    │
│ 19 │ Electabuzz       │ 4       │ 48    │
│ 20 │ Rhydon           │ 5       │ 52    │
│ 21 │ Dragonite        │ 2       │ 60    │
│ 22 │ Flareon          │ 2       │ 65    │
│ 23 │ Venusaur         │ 3       │ 70    │
│ 24 │ Zapdos           │ 4       │ 75    │
│ 25 │ Rhydon           │ 5       │ 80    │
└────┴──────────────────┴─────────┴───────┘
/**
Obtener el tipo y nivel de Pikachu.
**/
select t.nombre, p.nivel from Pokemon as p, tipo as t where p.nombre='Pikachu' and p.id_tipo=t.id;
**/
┌───────────┬───────┐
│  nombre   │ nivel │
├───────────┼───────┤
│ Eléctrico │ 15    │
└───────────┴───────┘
/**
Obtener los Pokémon de tipo Planta con nivel superior a 20:
**/
select * from Pokemon as p, tipo as t where t.nombre='Planta' and p.nivel>20 and p.id_tipo=t.id;
/**
┌────┬──────────┬─────────┬───────┬────┬────────┐
│ id │  nombre  │ id_tipo │ nivel │ id │ nombre │
├────┼──────────┼─────────┼───────┼────┼────────┤
│ 16 │ Venusaur │ 3       │ 45    │ 3  │ Planta │
│ 23 │ Venusaur │ 3       │ 70    │ 3  │ Planta │
└────┴──────────┴─────────┴───────┴────┴────────┘
**/

/**
Actualizar el tipo de Pikachu a "Eléctrico/Azul"
**/
update tipo set nombre='Eléctrico/Azul' where id=(select p.id_tipo from Pokemon as p where p.nombre='Pikachu'); 
/**
┌────┬────────────────┐
│ id │     nombre     │
├────┼────────────────┤
│ 1  │ Agua           │
│ 2  │ Fuego          │
│ 3  │ Planta         │
│ 4  │ Eléctrico/Azul │
│ 5  │ Tierra         │
└────┴────────────────┘
**/

















































```