CREATE OR REPLACE VIEW REPORTE_SQL.VIEW_EMPLEADOS_PROYECTOS_VIGENTES AS                                     -- crea la vista dentro del esquema del usuario REPORTE_SQL
SELECT p.codigo AS codigo_proyecto,                                                                         -- trae el codigo del proyecto
       p.nombre AS nombre_proyecto,                                                                         -- trae el nombre del proyecto
       d.nombre AS departamento,                                                                            -- trae el nombre del departamento responsable
       jp_per.apellido_pat || ' ' || jp_per.apellido_mat || ', ' || jp_per.nombres AS jefe_proyecto,        -- concatena apellidos y nombre del jefe de proyecto asignado
       e_per.apellido_pat || ' ' || e_per.apellido_mat || ', ' || e_per.nombres AS empleado_asignado,       -- concatena apellidos y nombre del empleado asignado
       ep.rol_proyecto,                                                                                     -- trae el rol que cumple el empleado
       ep.horas_semanales,                                                                                  -- trae las horas que dedica a la semana
       SUM(ep.horas_semanales) OVER (PARTITION BY p.codigo) AS total_horas_proyecto                         -- suma las horas de todos los empleados, agrupando por el codigo del proyecto
FROM APRENDIENDO_SQL.proyecto p                                                                             -- la tabla base es proyecto
INNER JOIN APRENDIENDO_SQL.departamento d                                                                   -- cruza con departamento para saber quien es responsable
  ON p.codigo_departamento = d.codigo
INNER JOIN APRENDIENDO_SQL.empleado jp                                                                      -- Cruza con empleado para obtener los datos del jefe
  ON p.codigo_jefe_proyecto = jp.codigo
INNER JOIN APRENDIENDO_SQL.persona jp_per                                                                   -- Cruza con persona para tener los textos de los nombres del jefe
  ON jp.rut_persona = jp_per.rut
LEFT JOIN APRENDIENDO_SQL.empleado_proyecto ep                                                              -- permite mostrar proyectos vigentes aunque no tengan empleados asignados
  ON p.codigo = ep.codigo_proyecto AND ep.fecha_termino IS NULL                                             -- Filtra para que solo sean asignaciones vigentes
LEFT JOIN APRENDIENDO_SQL.empleado e                                                                        -- Cruza para obtener el codigo del empleado asignado
  ON ep.codigo_empleado = e.codigo
LEFT JOIN APRENDIENDO_SQL.persona e_per                                                                     -- Cruza para obtener los nombres en texto del empleado asignado
  ON e.rut_persona = e_per.rut
WHERE p.estado = 'EN_CURSO'                                                                                 -- Filtra para que solo aparezcan proyectos en estado 'En_Curso'
ORDER BY p.nombre ASC, e_per.apellido_pat ASC                                                               -- Ordena por nombre de proyecto y luego por apellido del empleado
WITH READ ONLY;

SELECT * FROM REPORTE_SQL.VIEW_EMPLEADOS_PROYECTOS_VIGENTES;