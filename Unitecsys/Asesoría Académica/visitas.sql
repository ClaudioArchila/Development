SELECT alumnos.cuenta, asesoria_visita.fecha
    FROM alumnos,
         asesoria_alumnos, 
	  asesoria_visita
   WHERE ( alumnos.cuenta = asesoria_alumnos.cuenta ) and  
         ( asesoria_alumnos.cuenta = asesoria_visita.cuenta ) and 
         alumnos.modalidad = "1" AND  
        alumnos.nivel = '1' AND
         ( alumnos.fecha_ing < "2004-11-01 00:00:00" ) AND  
         ( asesoria_visita.fecha > "2005-01-01 00:00:00" ) AND  
         ( asesoria_visita.fecha < "2005-02-01 00:00:00" ) AND  
         asesoria_alumnos.codigo_rrhh >= 0 AND  
         asesoria_alumnos.codigo_rrhh <= 9999;