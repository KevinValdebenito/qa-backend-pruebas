CREATE TABLE hist_arriendo_anual_moto AS                                                                -- crea una nueva tabla física con el resultado de la consulta inferior
SELECT m.placa AS "PLACA",                                                                              -- inicia la selección de datos que irán dentro de la nueva tabla, guarda la placa de la moto
       m.modelo AS "MODELO",                                                                            -- guarda el modelo de la moto
       EXTRACT(YEAR FROM SYSDATE) AS "AÑO_PROCESO",                                                     -- extrae dinámicamente el año actual del sistema
       COUNT(a.id_arriendo) AS "CANT_ARRIENDOS",                                                        -- cuenta el total de veces que la moto fue arrendada
       SUM(a.dias_solicitados) AS "TOTAL_DIAS"                                                          -- suma el total de días que estuvo en arriendo
FROM motocicleta m                                                                                      -- define la tabla principal
JOIN arriendo_moto a                                                                                    -- cruza con la tabla de arriendos
  ON m.placa = a.placa                                                                                  -- une ambas tablas usando la placa de la motocicleta
WHERE EXTRACT(YEAR FROM a.fecha_ini_arriendo) = EXTRACT(YEAR FROM SYSDATE)                              -- filtra para contabilizar solo los arriendos que iniciaron en el año en curso
GROUP BY                                                                                                -- agrupa los cálculos...
    m.placa,                                                                                            -- ...por cada placa única
    m.modelo                                                                                            -- ...y modelo único
HAVING COUNT(a.id_arriendo) >= 2;                                                                       -- filtra los grupos resultantes para guardar solo las motos con 2 o más arriendos

SELECT * FROM hist_arriendo_anual_moto;                                                                 -- consulta final para visualizar que la tabla se creó y llenó correctamente
