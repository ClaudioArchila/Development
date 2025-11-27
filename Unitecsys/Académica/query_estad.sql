 select count( distinct alumnos.cuenta )
	from alumnos, matricula, secciones, alumnos_otras_estad_academicas ao
  where ( matricula.cuenta = alumnos.cuenta ) and 
		  ( alumnos.cuenta = ao.cuenta ) and
		  ( matricula.campus like "3" ) and 
		  ( matricula.anio = "2006" ) and 
		  ( matricula.semestre = "1" ) and 
		  ( secciones.campus like "3" ) and  
		  ( secciones.anio = "2006" ) and  
		  ( secciones.semestre = "1" ) and  
		  ( secciones.modulo = "1" ) and
		  ( secciones.seccion = matricula.seccion ) and
		  ( ao.anio_ingreso = "2006" ) and ( ao.semestre_ingreso = "1" ) and ( ao.modulo_ingreso = "2" ) and
		  ( alumnos.nivel = "1" ) and 
		  ( matricula.estado  not in ( select estados_cancelados.codigo from estados_cancelados) ) ;

 select count( distinct alumnos.cuenta )
	from alumnos, matricula, alumnos_otras_estad_academicas ao
  where   ( matricula.cuenta = alumnos.cuenta ) and          
			 ( alumnos.cuenta = ao.cuenta ) and                
			 ( ao.anio_ingreso = "2006" ) and ( ao.semestre_ingreso = "1" ) and ( ao.modulo_ingreso = "2" ) and
			 ( alumnos.nivel = "1" ) and 
			 ( matricula.campus like "3" ) and 
			 ( matricula.anio = "2006" ) and 
			 ( matricula.semestre = "1" ) and 
			 ( matricula.estado  not in ( select estados_cancelados.codigo from estados_cancelados) ) ;