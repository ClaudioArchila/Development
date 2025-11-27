print    'tes_talones_transicion'
SETUSER 'dbo'
;

create table dbo.tes_talones_transicion (
cuenta  char(10)    not null,
no_talonario    char(10)    not null,
constraint PK_TES_CUENTAS_X_COBRAR PRIMARY KEY NONCLUSTERED ( no_talonario )
)
lock datarows
on 'default'
;

print   'IDX_tes_talones_transicion'
create unique nonclustered index IDX_tes_talones_transicion
on dbo.tes_talones_transicion (no_talonario)
on 'default'
;

grant Delete on tes_talones_transicion to grupo_general 
;

grant Insert on tes_talones_transicion to grupo_general 
;

grant References on tes_talones_transicion to SCA_consultas 
;

grant References on tes_talones_transicion to banco 
;

grant References on tes_talones_transicion to consulta 
;

grant References on tes_talones_transicion to grupo_general 
;

grant Select on tes_talones_transicion to SCA_consultas 
;

grant Select on tes_talones_transicion to banco 
;

grant Select on tes_talones_transicion to consulta 
;

grant Select on tes_talones_transicion to grupo_general 
;

grant Update on tes_talones_transicion to banco 
;

grant Update on tes_talones_transicion to grupo_general 
;

SETUSER
;
