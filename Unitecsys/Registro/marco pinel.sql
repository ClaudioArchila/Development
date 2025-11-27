//select * from tes_cuentas_x_cobrar where anio = '2009' and semestre = '2' and cuenta = '10512024';

//select * from libros;

//select * from alumnos_otra_info where cuenta = '10411109';
//select * from matricula where cuenta = '10411109' and anio = '2009' and semestre = '2';

//select * from base_clases_cursar;

//begin transaction
//
//	declare @salida char(150) output, @costo_salida decimal(9,2)
//
//	execute sp_matricula '10411109', '928; ', '2', 0, 0, @salida out, @costo_salida out;
//
//commit transaction
//
//@cuenta char(10), @secciones varchar(100), @tipo_tran char(1), @monto_clases_can decimal(9,2), @monto_labs_can decimal(9,2), @salida char(150) output, @costo_salida decimal(9,2) output


//select * from alumnos where cuenta = '30921675';
//select * from alumnos_otra_info where cuenta = '30921675';

select * from alumnos_otras_estad_academicas 
where cuenta like '20953%' and
		cuenta in ( select cuenta from matricula where cuenta like '20953%' and estado not in (select codigo from estados_cancelados));