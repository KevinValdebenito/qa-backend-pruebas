SELECT e.numrun_emp || '-' || e.dvrun_emp AS "RUN",                                                       -- inicia la seleccion final de datos
       e.pnombre_emp || ' ' || e.appaterno_emp || ' ' || e.apmaterno_emp AS "Nombre Empleado",            -- une el primer nombre con ambos apellidos
       sub.total_arriendos AS "Total Arriendo Mes",                                                       -- rescata el conteo de arriendos desde la subconsulta
       sub.total_arriendos || '%' AS "% Bonificacion",                                                    -- convierte el total de arriendos en un porcentaje visual
       TO_CHAR(ROUND(e.sueldo_base * sub.total_arriendos / 100), '$999G999G999') AS "Monto Bonificacion"  -- calcula el bono, redondea y aplica formato de dinero
FROM empleado e                                                                                           -- define la tabla principal
JOIN (SELECT m.numrun_emp,                                                                                -- inicia la subconsulta en el FROM, inicia la seleccion de la subconsulta
             COUNT(a.id_arriendo) AS total_arriendos                                                      -- cuenta cuántas veces se arrendó
      FROM arriendo_moto a                                                                                -- define la tabla base de la subconsulta
      JOIN motocicleta m                                                                                  -- cruza con la tabla motos para saber quién es el encargado
        ON a.placa = m.placa                                                                              -- une ambas tablas por la placa
      WHERE EXTRACT(YEAR FROM a.fecha_ini_arriendo) = EXTRACT(YEAR FROM SYSDATE)                          -- filtra solo los arriendos del año en curso
      GROUP BY m.numrun_emp                                                                               -- agrupa el conteo por cada empleado encargado
      HAVING COUNT(a.id_arriendo) > 1) sub                                                                -- mantiene solo a los empleados con más de 1 arriendo, cierra la subconsulta y le da el alias "sub"
  ON e.numrun_emp = sub.numrun_emp                                                                        -- cruza la tabla principal (e) con la subconsulta (sub) usando el RUN
ORDER BY e.appaterno_emp DESC;                                                                            -- ordena el resultado final por apellido paterno de la Z a la A
