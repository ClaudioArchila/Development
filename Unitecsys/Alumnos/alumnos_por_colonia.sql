  SELECT colonias.Descripcion,   
         count(alumnos.cuenta )  
    FROM alumnos,   
         colonias  
   WHERE ( colonias.codigo_colonia = alumnos.codigo_colonia )   
GROUP BY colonias.Descripcion  
ORDER BY 2 DESC,   
         colonias.Descripcion ASC  ;
