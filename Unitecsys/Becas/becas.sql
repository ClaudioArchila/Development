print    'Creating alcance_becas . . .'
SETUSER 'dbo'
go

create table dbo.alcance_becas (
	porcentaje		smallint	not null,
	codigo_alcance	smallint	null,

	constraint alcance_becas PRIMARY KEY  NONCLUSTERED ( )
)
on 'default'
go

grant Delete on alcance_becas to public 
go

grant Insert on alcance_becas to public 
go

grant References on alcance_becas to public 
go

grant Select on alcance_becas to public 
go

grant Update on alcance_becas to public 
go


print    'Creating alumnos_becas . . .'
SETUSER 'dbo'
go
create table dbo.alumnos_becas (
	cuenta				char(10)	not null,
	codigo_beca			char(2)	not null,
	modulo				char(1)	not null,
	anio					char(4)	not null,
	codigo_patrocinador	char(3)	not null,
	codigo_termina		char(2)	not null,
	semestre				char(1)	not null,
	alcance				decimal(3, 0)	not null,
	f_inicio				datetime	not null,
	estado				char(1)	null,
	categoria				char(1)	null,
	beca_prestamo		char(1)	null,
	campus				char(3)	not null,
	
	constraint pk_becados PRIMARY KEY  NONCLUSTERED ( campus,anio,semestre,cuenta,codigo_beca)
)
on 'default'
go
grant Delete on alumnos_becas to Daniel 
go

grant Insert on alumnos_becas to Daniel 
go

grant References on alumnos_becas to Daniel 
go

grant Select on alumnos_becas to Daniel 
go

grant Update on alumnos_becas to Daniel 
go


SETUSER
go
alter table dbo.alumnos_becas 
add constraint dbo.fk_becados_alumnos foreign key (cuenta) references unitec.dbo.alumnos(cuenta)
alter table dbo.alumnos_becas 
add constraint dbo.fk_becados_catalogo_becas foreign key (codigo_beca) references unitec.dbo.catalogo_becas(codigo_beca)
alter table dbo.alumnos_becas 
add constraint dbo.fk_becados_patrocinadores foreign key (codigo_patrocinador) references unitec.dbo.patrocinadores(codigo_patrocinador)
alter table dbo.alumnos_becas 
add constraint dbo.fk_becados_terminaciones foreign key (codigo_termina) references unitec.dbo.terminaciones(codigo_termina)
go

print    'Creating catalogo_becas . . .'
SETUSER 'dbo'
go
create table dbo.catalogo_becas (
	codigo_beca		char(2)	not null,
	descripcion		char(40)	null,
	excluyente		char(1)	DEFAULT  '0' 	null,
	no_paga			char(1)	DEFAULT  '0'    	null,
	paga_despues	char(1)	DEFAULT  '0'    	null,
	
	constraint pk_catalogo_becas PRIMARY KEY  CLUSTERED ( codigo_beca)
)
on 'default'
go
grant Delete on catalogo_becas to public 
go

grant Insert on catalogo_becas to public 
go

grant References on catalogo_becas to public 
go

grant Select on catalogo_becas to public 
go

grant Update on catalogo_becas to public 
go


SETUSER
go

print    'Creating patrocinadores . . .'
SETUSER 'dbo'
go
create table dbo.patrocinadores (
	codigo_patrocinador	char(3)	not null,
	nombre				varchar(40)	not null,
	contacto				varchar(40)	null,
	dir					varchar(60)	null,
	telef					varchar(13)	null,
	fax					varchar(13)	null,
	email				varchar(40)	null,
	becados_actuales		smallint	null,

	constraint pk_patrocinadores PRIMARY KEY  CLUSTERED ( codigo_patrocinador)
)
on 'default'
go
grant Delete on patrocinadores to public 
go

grant Insert on patrocinadores to public 
go

grant References on patrocinadores to public 
go

grant Select on patrocinadores to public 
go

grant Update on patrocinadores to public 
go


SETUSER
go

print    'Creating terminaciones . . .'
SETUSER 'dbo'
go
create table dbo.terminaciones (
	codigo_termina	char(2)	not null,
	motivo			varchar(40)	not null,
	
	constraint pk_terminaciones PRIMARY KEY  CLUSTERED ( codigo_termina)
)
on 'default'
go
grant Delete on terminaciones to public 
go

grant Insert on terminaciones to public 
go

grant References on terminaciones to public 
go

grant Select on terminaciones to public 
go

grant Update on terminaciones to public 
go


SETUSER
go
