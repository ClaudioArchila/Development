  SELECT DISTINCT u.universidad,  
         es.materia_cursada, 
         es.tentativa, m.nombre_materia  
    FROM eqv_solicitud es, universidades u, materias m, eqv_materias em
   WHERE es.otorgada = '1'  and 
			es.codigo_univ <> '001' and 
			u.codigo_univ = es.codigo_univ and
			es.tentativa = m.codigo_materia and
			em.codigo_univ = es.codigo_univ and
			em.materia_cursada = es.;
