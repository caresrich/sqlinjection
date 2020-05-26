drop table if exists departamentos;
create table departamentos(
id integer unsigned primary key,
id_pais integer unsigned not null,
departamento varchar(50)not null
);
insert into departamento values('0','2','DESCONOCIDO');
insert into departamento values('1','2','Beni');
insert into departamento values('2','2','Chuquisaca');
insert into departamento values('3','2','Cochabamba');
insert into departamento values('4','2','La Paz');
insert into departamento values('5','2','Oruro');
insert into departamento values('6','2','Pando');
insert into departamento values('7','2','Potosí');
insert into departamento values('8','2','Santa Cruz');
insert into departamento values('9','2','Tarija');
