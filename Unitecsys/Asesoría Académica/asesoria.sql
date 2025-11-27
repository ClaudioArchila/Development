/* ============================================================ */
/*   Table: asesoria_motivos                                    */
/* ============================================================ */
create table asesoria_motivos
(
    codigo_motivo              char(2)                not null,
    descripcion                varchar(40)            not null,
    constraint PK_ASESORIA_MOTIVOS primary key clustered (codigo_motivo)
)
go

/* ============================================================ */
/*   Table: asesoria_asesores                                   */
/* ============================================================ */
create table asesoria_asesores
(
    campus                     char(3)                not null,
    codigo_rrhh                numeric(4)             not null,
    fecha_inicio               datetime               null    ,
    activo                     char(1)                null    ,
    hora_entrada1              char(8)                null    ,
    hora_salida1               char(8)                null    ,
    hora_entrada2              char(8)                null    ,
    hora_salida2               char(8)                null    ,
    ubicacion_fisica           varchar(25)            null    ,
    maximo                     int                    null    ,
    constraint PK_ASESORIA_ASESORES primary key clustered (campus, codigo_rrhh)
)
go

/* ============================================================ */
/*   Table: asesoria_alumnos                                    */
/* ============================================================ */
create table asesoria_alumnos
(
    campus                     char(3)                not null,
    codigo_motivo              char(2)                null    ,
    cuenta                     char(10)               not null,
    codigo_rrhh                numeric(4)             not null,
    activo                     char(1)                null    ,
    periodo                    char(1)                not null,
    anio                       char(4)                not null,
    constraint PK_ASESORIA_ALUMNOS primary key clustered (cuenta)
)
go

/* ============================================================ */
/*   Table: asesoria_alumnos_hist                               */
/* ============================================================ */
create table asesoria_alumnos_hist
(
    codigo_motivo              char(2)                null    ,
    campus                     char(3)                not null,
    cuenta                     char(10)               not null,
    codigo_rrhh                numeric(4)             not null,
    activo                     char(1)                null    ,
    periodo                    char(1)                not null,
    anio                       char(4)                not null,
    constraint PK_ASESORIA_ALUMNOS_HIST primary key clustered (campus, cuenta, codigo_rrhh, periodo, anio)
)
go

/* ============================================================ */
/*   Table: asesoria_bloqueo                                    */
/* ============================================================ */
create table asesoria_bloqueo
(
    cuenta                     char(10)               not null,
    constraint PK_ASESORIA_BLOQUEO primary key nonclustered (cuenta)
)
go

/* ============================================================ */
/*   Table: asesoria_visita                                     */
/* ============================================================ */
create table asesoria_visita
(
    cuenta                     char(10)               not null,
    fecha                      datetime               not null,
    codigo_rrhh                numeric(4)             not null,
    campus                     char(3)                not null,
    codigo_motivo              char(2)                null    ,
    constraint PK_ASESORIA_VISITA primary key clustered (cuenta, fecha)
)
go

alter table asesoria_asesores
    add constraint fk_personal_asesor foreign key  (campus, codigo_rrhh)
       references personal (campus, codigo_rrhh)
go

alter table asesoria_alumnos
    add constraint FK_ASESORIA_REF_126_ASESORIA foreign key  (codigo_motivo)
       references asesoria_motivos (codigo_motivo)
go

alter table asesoria_alumnos
    add constraint FK_ASESORIA_REF_21_ASESORIA foreign key  (campus, codigo_rrhh)
       references asesoria_asesores (campus, codigo_rrhh)
go

alter table asesoria_alumnos_hist
    add constraint FK_ASESORIA_REF_130_ASESORIA foreign key  (codigo_motivo)
       references asesoria_motivos (codigo_motivo)
go

alter table asesoria_alumnos_hist
    add constraint FK_ASESORIA_REF_134_ASESORIA foreign key  (campus, codigo_rrhh)
       references asesoria_asesores (campus, codigo_rrhh)
go

alter table asesoria_bloqueo
    add constraint fk_asesoria_alumnos_bloque foreign key  (cuenta)
       references alumnos (cuenta)
go

alter table asesoria_visita
    add constraint FK_ASESORIA_REF_171_ASESORIA foreign key  (codigo_motivo)
       references asesoria_motivos (codigo_motivo)
go

alter table asesoria_visita
    add constraint FK_ASESORIA_REF_29_ASESORIA foreign key  (cuenta)
       references asesoria_alumnos (cuenta)
go

alter table asesoria_visita
    add constraint FK_ASESORIA_REF_81_ASESORIA foreign key  (campus, codigo_rrhh)
       references asesoria_asesores (campus, codigo_rrhh)
go
