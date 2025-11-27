/* ============================================================ */
/*   Table: personal_asistencia                                 */
/* ============================================================ */
create table personal_asistencia
(
    campus			char(3)		not null,
    anio			char(4)		not null,
    semestre			char(1)		not null,
    seccion			char(5)		not null,
    fecha			char(10)	not null,
    llegadas_tarde		char(9)        default "" null,
    salidas_temprano		char(9)        default "" null,
    asigna_trabajo		char(1)        default "0" null,
    nsp_excusa			char(1)        default "0" null,
    nsp				char(1)        default "0" null,
    repuso			char(10)        default "" null,   
    observaciones		varchar(60)     null,

    constraint pk_personal_asistencia primary key ( campus, anio, semestre, seccion, fecha )
)
go

/* ============================================================ */
/*   Table: personal_academico                                  */
/* ============================================================ */
create table personal_academico
(
    campus						char(3)					not null,
    codigo_rrhh            numeric(4)           not null,
    fecha                  char(10)             not null    ,
    codigo_univ            char(3)              null,
    area                   char(3)              null,
    codigo_titulo          char(4)              null,
    grado                  char(1)              null,
    resolucion             varchar(15)          null,
    registro               varchar(15)          null    ,
    
    constraint pk_personal_academico primary key (campus, codigo_rrhh, fecha)
)
go

/* ============================================================ */
/*   Table: personal_crecimiento                                */
/* ============================================================ */
create table personal_crecimiento
(
    campus						char(3)					  not null,
    codigo_rrhh            numeric(4)             not null,
    fecha                  char(10)               not null,
    codigo_puesto          char(3)                null,
    puesto_anterior1       char(3)                null,
    salario_anterior       money                  null,
    salario_actual         money                  null,
    constraint pk_personal_crecimiento primary key (campus, codigo_rrhh, fecha)
)
go

/* ============================================================ */
/*   Table: personal_permisos                                   */
/* ============================================================ */
create table personal_permisos
(
    campus						char(3)					not null,
    codigo_rrhh            numeric(4)           not null,
    fecha                  datetime             not null,
    codigo_permiso         char(3)              null,
    duracion1              char(3)              null,
    constraint pk_personal_permisos primary key (campus, codigo_rrhh, fecha)
)
go

/* ============================================================ */
/*   Table: personal_exclusivo                                  */
/* ============================================================ */
create table personal_exclusivo
(
    campus		   			char(3)		  			  not null,
    codigo_rrhh            numeric(4)             not null,
    fecha_cambio           char(10)               null,
    codigo_puesto          char(3)                null,
    codigo_depto           char(2)                null,
    fecha_cancelacion      char(10)               null,
    motivo_cancelacion     char(2)                null,
    salario                money                  null,
    freq_pago_             char(1)                null,
    cta_banco              char(10)               null    ,
    constraint pk_personal_exclusivo primary key (campus, codigo_rrhh)
)
go

/* ============================================================ */
/*   Table: personal_eventos                                    */
/* ============================================================ */
create table personal_eventos
(
    campus		   char(3)		  not null,
    codigo_rrhh            numeric(4)             not null,
    fecha                  char(10)               not null,
    institucion            char(40)               null,
    pais                   char(3)                null    ,
    area1                  char(3)                null,
    nombre_evento          varchar(60)            null,
    tipo_asistencia        char(1)                null,
    duracion               char(3)                null    ,
    constraint pk_personal_eventos primary key (campus, codigo_rrhh, fecha)
)
go

/* ============================================================ */
/*   Table: personal_emergencias                                */
/* ============================================================ */
create table personal_emergencias
(
    campus			char(3)		  not null,
    codigo_rrhh            numeric(4)             not null,
    alergias               varchar(60)            null,
    afecciones             varchar(60)            null,
    nombre_emergencia      varchar(40)            null,
    telefono_emergencia    varchar(13)            null,
    tipo_sangre            char(2)                null,
    constraint pk_personal_emergencias primary key (campus, codigo_rrhh)
)
go

/* ============================================================ */
/*   Table: personal_idiomas                                    */
/* ============================================================ */
create table personal_idiomas
(
    campus						char(3)					  not null,
    codigo_rrhh            numeric(4)             not null,
    idioma                 varchar(15)            not null,
    habla                  char(1)                default '0' null,
    lee                    char(1)                default '0' null,
    escribe                char(1)                default '0' null,
    constraint pk_personal_idiomas primary key (campus, codigo_rrhh, idioma)
)
go

/* ============================================================ */
/*   Table: personal_experiencia                                */
/* ============================================================ */
create table personal_experiencia
(
    campus						char(3)					not null,
    codigo_rrhh            numeric(4)           not null,
    experiencia            varchar(40)          null,
/*    constraint pk_personal_experiencia primary key (campus, codigo_rrhh)*/
)
go

/* ============================================================ */
/*   Table: personal_laboral                                    */
/* ============================================================ */
create table personal_laboral
(
    campus						char(3)					  not null,
    codigo_rrhh            numeric(4)             not null,
    lugar_trabajo          varchar(40)            null,
    telefono_trabajo       varchar(13)            null,
    puesto                 varchar(40)            null,
    fecha_inicio           char(10)               not null,
    fecha_final            char(10)               null,
    constraint pk_personal_laboral primary key (campus, codigo_rrhh, fecha_inicio)
)
go

alter table personal
    add constraint fk_personal_pais foreign key  (codigo_pais)
       references pais (codigo_pais)
go

alter table personal
    add constraint fk_personal_depto foreign key  (codigo_depto)
       references departamento (codigo_depto)
go

alter table personal
    add constraint fk_personal_ciudad foreign key  (codigo_ciudad)
       references ciudad (codigo_ciudad)
go

alter table personal
    add constraint fk_personal_instituto foreign key  (codigo_instituto)
       references institutos (codigo_instituto)
go

alter table personal_academico
    add constraint fk_personal_academicos foreign key  (campus, codigo_rrhh)
       references personal (campus, codigo_rrhh)
go

alter table personal_academico
    add constraint fk_univerisidad_personal foreign key  (codigo_univ)
       references universidades (codigo_univ)
go

alter table personal_academico
    add constraint fk_personal_areas foreign key  (area)
       references areas_academicas (area)
go

alter table personal_asistencia
    add constraint fk_personal_asistencia_seccion foreign key  (campus, anio, semestre, seccion)
       references secciones (campus, anio, semestre, seccion)
go

alter table personal_academico
    add constraint fk_personal_titulos foreign key  (codigo_titulo)
       references titulos (codigo_titulo)
go

alter table personal_crecimiento
    add constraint fk_personal_crecimiento foreign key  (campus,codigo_rrhh)
       references personal (campus,codigo_rrhh)
go

alter table personal_crecimiento
    add constraint personal_crecimiento_puesto foreign key  (codigo_puesto)
       references personal_cat_puesto (codigo_puesto)
go

alter table personal_permisos
    add constraint fk_permisos_personal foreign key  (campus,codigo_rrhh)
       references personal (campus,codigo_rrhh)
go

alter table personal_permisos
    add constraint fk_personal_permiso foreign key  (codigo_permiso)
       references personal_cat_permisos (codigo_permiso)
go

alter table personal_exclusivo
    add constraint fk_personal_exclusivo foreign key  (campus,codigo_rrhh)
       references personal (campus,codigo_rrhh)
go

alter table personal_exclusivo
    add constraint fk_personal_exclusivo_puesto foreign key  (codigo_puesto)
       references personal_cat_puesto (codigo_puesto)
go

alter table personal_exclusivo
    add constraint fk_personal_exclusivo_depto foreign key  (codigo_depto)
       references personal_cat_depto (codigo_depto)
go

alter table personal_exclusivo
    add constraint fk_personal_exclusivo_motivo foreign key  (motivo_cancelacion)
       references personal_cat_motivos (codigo_motivo_cancelacion)
go

alter table personal_eventos
    add constraint fk_personal_eventos foreign key  (campus,codigo_rrhh)
       references personal (campus,codigo_rrhh)
go

alter table personal_emergencias
    add constraint fk_personal_emergencias foreign key  (campus,codigo_rrhh)
       references personal (campus,codigo_rrhh)
go

alter table personal_idiomas
    add constraint fk_personal_idiomas foreign key  (campus,codigo_rrhh)
       references personal (campus,codigo_rrhh)
go

alter table personal_experiencia
    add constraint fk_personal_experiencia foreign key  (campus,codigo_rrhh)
       references personal (campus,codigo_rrhh)
go

alter table personal_laboral
    add constraint fk_personal_laboral foreign key  (campus,codigo_rrhh)
       references personal (campus,codigo_rrhh)
go