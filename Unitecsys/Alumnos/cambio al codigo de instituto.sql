// Tegucigalpa

//alter table alumnos_colegio drop constraint FK_ALUMNOS__REFERENCE_INSTITUT
//alter table personal drop constraint FK_PERSONAL_REFERENCE_INSTITUT
//alter table rec_personal drop constraint FK_REC_PERS_REFERENCE_INSTITUT;
//alter table institutos drop constraint pk_instituto;
//alter table institutos modify codigo_instituto char(6) not null;
//alter table personal modify instituto char(6)null;
//alter table alumnos_colegio modify codigo_instituto char(6) not null;
//alter table rec_personal modify codigo_instituto char(6)null;
//alter table institutos add constraint pk_institutos primary key clustered (codigo_instituto);
//alter table personal add  constraint FK_PERSONAL_REFERENCE_INSTITUT foreign key (instituto) references institutos;
//alter table alumnos_colegio add constraint FK_ALUMNOS__REFERENCE_INSTITUT foreign key (codigo_instituto) references institutos;
//alter table rec_personal add constraint FK_REC_PERS_REFERENCE_INSTITUT foreign key (codigo_instituto) references institutos;


// San Pedro Sula
//alter table alumnos_colegio drop constraint fk_alumnos_colegio_instituto
//alter table personal drop constraint fk_personal_institutos
//alter table institutos drop constraint pk_instituto;
//alter table institutos modify codigo_instituto char(6) not null;
//alter table personal modify codigo_instituto char(6)null;
//alter table alumnos_colegio modify codigo_instituto char(6) not null;
//alter table institutos add constraint pk_institutos primary key clustered (codigo_instituto);
//alter table personal add  constraint fk_personal_institutos foreign key (codigo_instituto) references institutos;
//alter table alumnos_colegio add constraint fk_alumnos_colegio_instituto foreign key (codigo_instituto) references institutos;
