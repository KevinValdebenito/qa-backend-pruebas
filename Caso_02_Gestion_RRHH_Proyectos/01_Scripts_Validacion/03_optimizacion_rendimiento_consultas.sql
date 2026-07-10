-- Índice para la consulta de Tareas
CREATE INDEX IDX_FECHA ON APRENDIENDO_SQL.tarea(fecha_fin_estimada);

-- Índice para la consulta de Asistencias
CREATE INDEX IDX_HSALIDAS ON APRENDIENDO_SQL.asistencia(fecha);

-- Consulta optimizada usando los índices creados
SELECT PR.NOMBRE AS PROYECTO,
       T.NOMBRE AS TAREA,
       T.FECHA_FIN_ESTIMADA
FROM TAREA T
INNER JOIN PROYECTO PR 
  ON PR.CODIGO = T.CODIGO_PROYECTO
WHERE T.ESTADO = 'PENDIENTE' OR T.PRIORIDAD = 'CRITICA'
ORDER BY T.FECHA_FIN_ESTIMADA;
