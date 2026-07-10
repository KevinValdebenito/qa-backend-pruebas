SELECT e.numrun_emp || '-' || e.dvrun_emp AS "RUN",                                                             -- inicia la seleccion de datos, concatena el RUN con el guion y su digito verificador
       e.appaterno_emp || ' ' || e.apmaterno_emp || ' ' || e.pnombre_emp || NVL(' ' || e.snombre_emp, '') AS "Nombre Completo", -- une los nombres y apellidos, usando NVL para evitar espacios extra si no hay 2do nombre
       TO_CHAR(e.fecha_contrato, 'DD/MM/YYYY') AS "Fecha Contrato",                                             -- da formato de dia/mes/ano a la fecha
       ec.nombre_estado_civil AS "Estado Civil",                                                                -- muestra el estado civil en texto
       TO_CHAR(e.sueldo_base, '$999G999G999') AS "Sueldo Base",                                                 -- aplica formato de moneda al sueldo
       TO_CHAR(ROUND(e.sueldo_base * pb.porcentaje / 100), '$999G999G999') AS "Monto Bono 30 Años",             -- calcula el bono redondeado y le da formato de moneda
       TRUNC(pb.porcentaje) || '%' AS "% Sueldo Base"                                                           -- quita los decimales al porcentaje y le anade el simbolo %
FROM empleado e                                                                                                 -- define la tabla principal
JOIN estado_civil ec                                                                                            -- cruza con la tabla de estado civil
  ON e.id_estado_civil = ec.id_estado_civil                                                                     -- condicion para unir el estado civil
JOIN porc_bonif_annos pb                                                                                        -- cruza con la tabla de bonificaciones
  ON e.sueldo_base BETWEEN pb.sueldo_desde AND pb.sueldo_hasta                                                  -- une validando si el sueldo esta dentro del rango
WHERE TRUNC(MONTHS_BETWEEN(LAST_DAY(SYSDATE), e.fecha_contrato) / 12) < 25                                      -- filtra a quienes tengan menos de 25 anos de servicio calculados al ultimo dia del mes actual
ORDER BY                                                                                                        -- inicia el ordenamiento
    e.fecha_contrato ASC,                                                                                       -- 1. ordena por fecha de contrato
    e.appaterno_emp ASC;                                                                                        -- 2. desempata por apellido paterno
    