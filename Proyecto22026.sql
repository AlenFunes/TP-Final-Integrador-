create database proyecto22026;

use proyecto22026;
create table socios(
id_socio int not null auto_increment,
nombre varchar(30),
apellido varchar(30),
dni int not null unique,
mail varchar(30),
fecha_alta date,
estado int null,
primary key(id_socio));

insert into socios values(1,'nicolas','Fernandez',29031734,'sarasa@gmail.com','2022-06-24',1);
insert into socios values(2,'Pedro','Juanito',32345456,'sarasa1@gmail.com','2022-06-24',1);
insert into socios values(3,'Cecilia','Lopez',28456765,'sarasa2@gmail.com','2022-06-24',0);
insert into socios values(20,'Ceciliaa','Lopezz',28456235,'sarasa23@gmail.com','2022-06-24',0);

select * from socios;