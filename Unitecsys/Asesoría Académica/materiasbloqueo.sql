use unitec
go

create table asesoria_materias_bloqueo (
cuenta	char(10)	not null,
codigo_materia	char(10)	not null,
veces	int	not null,
foreign key (cuenta) references alumnos, 
foreign key (codigo_materia) references materias
)
go


