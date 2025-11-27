  SELECT ciudad.nombre_ciudad,   
         colonias.Descripcion,   
         count( alumnos.cuenta )  
    FROM alumnos,   
         colonias,   
         ciudad  
   WHERE ( colonias.codigo_colonia = alumnos.codigo_colonia ) and  
         ( ciudad.codigo_ciudad = colonias.codigo_ciudad )   
GROUP BY ciudad.nombre_ciudad,   
         colonias.Descripcion  ;
