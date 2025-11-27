//select * from matricula where seccion = '1514' and cuenta = '10711156';

//select * from semaforo;

//select * from biblioteca_morosos;

// select * from secciones where seccion like 'S%';
//select * from secc_alumnos where seccion = 'SC-907';

select distinct matricula.cuenta
from matricula, secciones
where secciones.campus = matricula.campus and
		secciones.anio = matricula.anio and
		secciones.semestre = matricula.semestre and
		secciones.seccion = matricula.seccion and
		matricula.anio = "2007" and
		matricula.semestre = '2' and
		secciones.modulo = '4' and
		cuenta not in ( select matricula.cuenta
							   from matricula, secciones
							  where secciones.campus = matricula.campus and
		                       secciones.anio = matricula.anio and
		                       secciones.semestre = matricula.semestre and
		                       secciones.seccion = matricula.seccion and
		                       matricula.anio = "2007" and
		                       matricula.semestre = '2' and
		                       secciones.modulo = '5'
		) and 
		cuenta in ( select cuenta
					   from alcance_becas,alumnos_becas,catalogo_becas
					   where alcance_becas.codigo_alcance = alumnos_becas.alcance and
                        catalogo_becas.codigo_beca = alumnos_becas.codigo_beca and
                        catalogo_becas.credito_educativo <> '1' and
                        alumnos_becas.estado = '1' and
                        alumnos_becas.codigo_termina = "99" );

//select * from matricula where anio = '2007' and semestre = '2' and cuenta = '10611183';
//select * from tes_cuentas_x_cobrar where anio = '2007' and semestre = '2' and cuenta = '10611183';
//select * from alumnos_becas where cuenta = '10611183';
//select * from alumnos_otra_info where cuenta = '10611183';