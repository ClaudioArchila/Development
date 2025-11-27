print    'Creating alumnos . . .'
SETUSER 'dbo'
go
create table dbo.alumnos (
	cuenta				char(10)	not null,
	codigo_ciudad			char(3)	DEFAULT  '999' 	not null,
	codigo_depto			char(2)	DEFAULT  '99'  	not null,
	codigo_pais			char(3)	DEFAULT  '999' 	not null,
	codigo_municipio		char(4)	DEFAULT  '9999' 	not null,
	nombre				varchar(70)	not null,
	fecha_ing				datetime	not null,
	modalidad			char(1)	not null,
	nivel				char(1)	not null,
	carrera				char(4)	not null,
	fecha_nac			datetime	null,
	nacionalidad			char(3)	DEFAULT  '999' 	not null,
	sexo				char(1)	DEFAULT  '1' 	not null,
	estado_civil			char(1)	DEFAULT  '1' 	not null,
	tipo_identificacion		char(1)	DEFAULT  '1' 	null,
	identificacion			varchar(20)	null,
	direccion_perm		varchar(60)	null,
	direccion_actual		varchar(60)	null,
	telefono_perm			varchar(15)	null,
	telefono_actual		varchar(15)	null,
	e_mail				varchar(40)	null,
	financiamiento			char(1)	null,
	activo				char(1)	DEFAULT  '1' 	null,
	indice_general		numeric(6, 2)	DEFAULT  0 	null,
	indice_sem_anterior	numeric(6, 2)	DEFAULT  0 	null,
	uv_cursadas			smallint	DEFAULT  0 	null,
	anio_plan			char(2)	not null,
	cambios				char(1)	null,
	municipio_trabajo		char(4)	null,
	indice_graduacion		numeric(6, 2)	DEFAULT  0 	null,
	campus				char(3)	null,

	cuenta_2				char(10)	null,
	universidad			char(30	null,

	constraint pk_alumnos PRIMARY KEY  CLUSTERED ( cuenta)
)
on 'default'
go
grant Delete on alumnos to public 
go

grant Insert on alumnos to public 
go

grant References on alumnos to public 
go

grant Select on alumnos to guest with grant option
go

grant Select on alumnos to public 
go

grant Update on alumnos to public 
go


SETUSER
go
alter table dbo.alumnos 
add constraint dbo.fk_alumnos_ciudad foreign key (codigo_ciudad) references unitec.dbo.ciudad(codigo_ciudad)
alter table dbo.alumnos 
add constraint dbo.fk_alumnos_depto foreign key (codigo_depto) references unitec.dbo.departamento(codigo_depto)
alter table dbo.alumnos 
add constraint dbo.fk_alumnos_pais foreign key (codigo_pais) references unitec.dbo.pais(codigo_pais)
alter table dbo.alumnos 
add constraint dbo.fk_municipio foreign key (codigo_municipio) references unitec.dbo.municipio(codigo_municipio)
go

print    'alumnos_colegio'
SETUSER 'dbo'
go
create table dbo.alumnos_colegio (
	cuenta				char(10)	not null,
	codigo_municipio		char(4)	not null,
	codigo_instituto		char(3)	not null,
	codigo_tit_secundaria	char(4)	not null,
	
	constraint pk_alumnos_colegio PRIMARY KEY  CLUSTERED ( cuenta)
)
on 'default'
go
grant Delete on alumnos_colegio to public 
go

grant Insert on alumnos_colegio to public 
go

grant References on alumnos_colegio to public 
go

grant Select on alumnos_colegio to public 
go

grant Update on alumnos_colegio to public 
go


SETUSER
go
alter table dbo.alumnos_colegio 
add constraint dbo.fk_colegio_alumnos foreign key (cuenta) references unitec.dbo.alumnos(cuenta)
alter table dbo.alumnos_colegio 
add constraint dbo.fk_alumnos_titulo_secundaria foreign key (codigo_tit_secundaria) references unitec.dbo.alumnos_tit_secundaria(codigo_tit_secundaria)
alter table dbo.alumnos_colegio 
add constraint dbo.fk_municipio_colegios foreign key (codigo_municipio) references unitec.dbo.municipio(codigo_municipio)
alter table dbo.alumnos_colegio 
add constraint dbo.fk_colegios_alumnos foreign key (codigo_instituto) references unitec.dbo.institutos(codigo_instituto)
go

print    'Creating alumnos_documentos . . .'
SETUSER 'dbo'
go
create table dbo.alumnos_documentos (
	cuenta		char(10)	not null,
	solicitud		char(1)	DEFAULT  '0' 	null,
	titulo		char(1)	DEFAULT  '0' 	null,
	identificacion	char(1)	DEFAULT  '0' 	null,
	fotos		char(1)	DEFAULT  '0' 	null,
	temporal		char(1)	DEFAULT  '0' 	null,

	constraint pk_alumnos_documentos PRIMARY KEY  CLUSTERED ( cuenta)
)
on 'default'
go
grant Delete on alumnos_documentos to public 
go

grant Insert on alumnos_documentos to public 
go

grant References on alumnos_documentos to public 
go

grant Select on alumnos_documentos to public 
go

grant Update on alumnos_documentos to public 
go


SETUSER
go

print    'Creating alumnos_emergencia . . .'
SETUSER 'dbo'
go
create table dbo.alumnos_emergencia (
	cuenta				char(10)	not null,
	tipo_sangre			char(2)	null,
	alergias				varchar(60)	null,
	afecciones			varchar(60)	null,
	nombre_emergencia	varchar(40)	null,
	telefono_emergencia	char(13)	null,

	constraint pk_emergencia_alumnos PRIMARY KEY  CLUSTERED ( cuenta)
)
on 'default'
go
grant Delete on alumnos_emergencia to public 
go

grant Insert on alumnos_emergencia to public 
go

grant References on alumnos_emergencia to public 
go

grant Select on alumnos_emergencia to public 
go

grant Update on alumnos_emergencia to public 
go


SETUSER
go
alter table dbo.alumnos_emergencia 
add constraint dbo.fk_alumnos_emergencias foreign key (cuenta) references unitec.dbo.alumnos(cuenta)
go

print    'Creating alumnos_extracurriculares . . .'
SETUSER 'dbo'
go
create table dbo.alumnos_extracurriculares (
	cuenta		char(10)	not null,
	actividad		char(40)	null,

	constraint pk_alumnos_extracurriculares PRIMARY KEY  CLUSTERED ( cuenta)
)
on 'default'
go
print   'extracurriculares'
create nonclustered index extracurriculares
on dbo.alumnos_extracurriculares (cuenta)
on 'default'
go

go
grant Delete on alumnos_extracurriculares to public 
go

grant Insert on alumnos_extracurriculares to public 
go

grant References on alumnos_extracurriculares to public 
go

grant Select on alumnos_extracurriculares to public 
go

grant Update on alumnos_extracurriculares to public 
go


SETUSER
go
alter table dbo.alumnos_extracurriculares 
add constraint dbo.fk_alumnos_extracurriculares foreign key (cuenta) references unitec.dbo.alumnos(cuenta)
go

print    'alumnos_idioma'
SETUSER 'dbo'
go
create table dbo.alumnos_idioma (
	cuenta	char(10)	not null,
	idioma	varchar(10)	null,
	escribe	char(1)	DEFAULT  '0' 	null,
	habla	char(1)	DEFAULT  '0' 	null,
	lee		char(1)	DEFAULT  '0' 	null,

	constraint pk_alumnos_idioma PRIMARY KEY  CLUSTERED ( cuenta)
)
on 'default'
go
grant Delete on alumnos_idioma to public 
go

grant Insert on alumnos_idioma to public 
go

grant References on alumnos_idioma to public 
go

grant Select on alumnos_idioma to public 
go

grant Update on alumnos_idioma to public 
go


SETUSER
go
alter table dbo.alumnos_idioma 
add constraint dbo.fk_alumnos_idioma foreign key (cuenta) references unitec.dbo.alumnos(cuenta)
go

print    'alumnos_padres'
SETUSER 'dbo'
go
create table dbo.alumnos_padres (
	cuenta			char(10)	not null,
	padre			char(1)	not null,
	nombre_padre		varchar(40)	null,
	profesion			varchar(30)	null,
	trabajo			varchar(40)	null,
	telefono			varchar(15)	null,
	salario			numeric(10, 2)	DEFAULT  0 	null,
	nivel_educativo	char(1)	null,

	constraint pk_alumnos_padres PRIMARY KEY  CLUSTERED ( cuenta,padre)
)
on 'default'
go
grant Delete on alumnos_padres to public 
go

grant Insert on alumnos_padres to public 
go

grant References on alumnos_padres to public 
go

grant Select on alumnos_padres to public 
go

grant Update on alumnos_padres to public 
go


SETUSER
go
alter table dbo.alumnos_padres 
add constraint dbo.fk_padres_alumnos foreign key (cuenta) references unitec.dbo.alumnos(cuenta)
go

print    'alumnos_trabajos'
SETUSER 'dbo'
go
create table dbo.alumnos_trabajos (
	cuenta		char(10)	not null,
	desde		datetime	not null,
	codigo_pais	char(3)	null,
	puesto		varchar(30)	null,
	institucion	varchar(30)	null,
	hasta		datetime	null,

	constraint pk_alumnos_trabajos PRIMARY KEY  CLUSTERED ( cuenta,desde)
)
on 'default'
go
grant Delete on alumnos_trabajos to public 
go

grant Insert on alumnos_trabajos to public 
go

grant References on alumnos_trabajos to public 
go

grant Select on alumnos_trabajos to public 
go

grant Update on alumnos_trabajos to public 
go


SETUSER
go
alter table dbo.alumnos_trabajos 
add constraint dbo.fk_alumnos_trabajos_alumnos foreign key (cuenta) references unitec.dbo.alumnos(cuenta)
alter table dbo.alumnos_trabajos 
add constraint dbo.fk_alumnos_trabajos_pais foreign key (codigo_pais) references unitec.dbo.pais(codigo_pais)
go

print    'Creating alumnos_universidad . . .'
SETUSER 'dbo'
go
create table dbo.alumnos_universidad (
	cuenta				char(10)	not null,
	codigo_univ			char(3)	not null,
	codigo_titulo			char(4)	not null,
	egresado				char(1)	DEFAULT  '0' 	null,
	materias_aprobadas	char(2)	null,
	grado_conferido		char(2)	null,
	fecha_inicio_univ		datetime	null,
	fecha_final_univ		datetime	null,

	constraint pk_alumnos_universidad PRIMARY KEY  CLUSTERED ( cuenta,codigo_univ,codigo_titulo)
)
on 'default'
go
print   'alumno_cuenta_universidad'
create nonclustered index alumno_cuenta_universidad
on dbo.alumnos_universidad (cuenta)
on 'default'
go

go
grant Delete on alumnos_universidad to public 
go

grant Insert on alumnos_universidad to public 
go

grant References on alumnos_universidad to public 
go

grant Select on alumnos_universidad to public 
go

grant Update on alumnos_universidad to public 
go


SETUSER
go
alter table dbo.alumnos_universidad 
add constraint dbo.fk_universidad_alumnos foreign key (cuenta) references unitec.dbo.alumnos(cuenta)
alter table dbo.alumnos_universidad 
add constraint dbo.fk_alumnos_universidad foreign key (codigo_univ) references unitec.dbo.universidades(codigo_univ)
alter table dbo.alumnos_universidad 
add constraint dbo.fk_alumnos_universidad_titulos foreign key (codigo_titulo) references unitec.dbo.titulos(codigo_titulo)
go

print    'Creating alumnos_tit_secundaria . . .'
SETUSER 'dbo'
go
create table dbo.alumnos_tit_secundaria (
	codigo_tit_secundaria	char(4)	not null,
	descripcion			varchar(60)	not null,

	constraint pk_alumnos_tit_secundaria PRIMARY KEY  CLUSTERED ( codigo_tit_secundaria)
)
on 'default'
go
grant Delete on alumnos_tit_secundaria to public 
go

grant Insert on alumnos_tit_secundaria to public 
go

grant References on alumnos_tit_secundaria to public 
go

grant Select on alumnos_tit_secundaria to public 
go

grant Update on alumnos_tit_secundaria to public 
go


SETUSER
go

print    'Creating institutos . . .'
SETUSER 'dbo'
go
create table dbo.institutos (
	codigo_instituto	char(3)	not null,
	codigo_pais		char(3)	DEFAULT  '999' 	not null,
	codigo_ciudad		char(3)	DEFAULT  '999' 	not null,
	nombre_instituto	char(45)	not null,
	privado			char(1)	DEFAULT  '1' 	null,
	bilingue			char(1)	DEFAULT  '0' 	null,

	constraint pk_instituto PRIMARY KEY  NONCLUSTERED ( codigo_instituto)
)
on 'default'
go

SETUSER
go

print    'Creating universidades . . .'
SETUSER 'dbo'
go
create table dbo.universidades (
	codigo_univ	char(3)	not null,
	universidad	varchar(40)	not null,
	pais			char(3)	DEFAULT  '999' 	null,
	ciudad		char(3)	DEFAULT  '999' 	null,
	telefono		varchar(13)	null,
	email		varchar(20)	null,
	fax			varchar(13)	null,

	constraint pk_universidades PRIMARY KEY  CLUSTERED ( codigo_univ)
)
on 'default'
go
grant Delete on universidades to public 
go

grant Insert on universidades to public 
go

grant References on universidades to public 
go

grant Select on universidades to public 
go

grant Update on universidades to public 
go


SETUSER
go

print    'Creating ciudad . . .'
SETUSER 'dbo'
go
create table dbo.ciudad (
	codigo_ciudad		char(3)		not null,
	nombre_ciudad	varchar(40)	not null,

	constraint pk_ciudad PRIMARY KEY  CLUSTERED ( codigo_ciudad)
)
on 'default'
go
grant Delete on ciudad to public 
go

grant Insert on ciudad to public 
go

grant References on ciudad to public 
go

grant Select on ciudad to public 
go

grant Update on ciudad to public 
go


SETUSER
go

print    'Creating pais . . .'
SETUSER 'dbo'
go
create table dbo.pais (
	codigo_pais	char(3)	not null,
	nombre_pais	char(40)	not null,

	constraint pk_pais PRIMARY KEY  CLUSTERED ( codigo_pais)
)
on 'default'
go
grant Delete on pais to public 
go

grant Insert on pais to public 
go

grant References on pais to public 
go

grant Select on pais to public 
go

grant Update on pais to public 
go

SETUSER
go
