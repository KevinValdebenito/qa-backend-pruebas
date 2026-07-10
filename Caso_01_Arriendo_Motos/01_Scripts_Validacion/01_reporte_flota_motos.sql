SELECT t.nombre_tipo_moto AS "Tipo Moto",                                         -- SELECT incia la seleccion de datos, muestra el tipo de moto
       m.placa AS "Placa",                                                        -- muestra la placa
       m.color AS "Color",                                                        -- muestra el color
       m.modelo AS "Modelo",                                                      -- muestra el modelo
       m.cilindrada || ' cc' AS "Cilindrada",                                     -- concatena el texto ' cc' al numero
       m.anio_fab AS "Año Fabricada",                                             -- muestra el año de fabricacion
       TO_CHAR(m.valor_arriendo_dia, '$999G999') AS "Ariendo/Dia",                -- formato de moneda al arriendo
       TO_CHAR(m.valor_garantia_dia, '$999G999') AS "Garantia/Dia",               -- formato de moneda a la garantia
       TO_CHAR(m.valor_arriendo_dia + m.valor_garantia_dia, '$999G999') AS "Total/Dia", -- suma ambos valores y da formato
       SUBSTR(TO_CHAR(e.numrun_emp), 3, 1) || UPPER(                              -- saca el 3er digito del run y convierte a mayusculas lo que sigue
           CASE t.nombre_tipo_moto                                                -- evalua el tipo de moto para sacar las letras
               WHEN 'Deportiva' THEN SUBSTR(e.apmaterno_emp, 1, 1) || SUBSTR(e.apmaterno_emp, 3, 1) -- 1ra y 3ra letra
               WHEN 'Naked' THEN SUBSTR(e.apmaterno_emp, 2, 1) || SUBSTR(e.apmaterno_emp, LENGTH(e.apmaterno_emp), 1) -- 2da y ultima letra
               WHEN 'Scooter' THEN SUBSTR(e.apmaterno_emp, 1, 2)                  -- 1ra y 2da letra
               ELSE SUBSTR(e.apmaterno_emp, 2, 2)                                 -- 2da y 3ra letra para el resto
           END
       ) || '@motorent.cl' AS "Correo Encargado"                                  -- agrega el dominio del correo
FROM motocicleta m                                                                -- define la tabla principal (motos)
JOIN tipo_moto t ON m.id_tipo_moto = t.id_tipo_moto                               -- cruza con los tipos de moto
JOIN empleado e ON m.numrun_emp = e.numrun_emp                                    -- cruza con los empleados
ORDER BY                                                                          -- inicia el ordenamiento
    t.nombre_tipo_moto ASC,                                                       -- 1. ordena por tipo
    m.valor_arriendo_dia DESC,                                                    -- 2. desempata por arriendo
    m.valor_garantia_dia ASC,                                                     -- 3. desempata por garantia
    m.placa ASC;                                                                  -- 4. desempata por placa