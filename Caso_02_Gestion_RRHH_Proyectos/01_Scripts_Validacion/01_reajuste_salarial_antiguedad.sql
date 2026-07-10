UPDATE aprendiendo_sql.empleado
-- inicia la actualizacion masiva en la tabla empleado del usuario Aprendiendo
SET salario_bruto = ROUND(
    -- round: redondea el resultado final para que no queden decimales
    CASE
        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, fecha_contrato) / 12) >= 20 THEN salario_bruto * 1.12
        -- trunc quita decimales a la division de los meses entre hoy y el contrato, si lleva 20 años o mas, multiplica el sueldo por 1.12 (12% mas)
        
        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, fecha_contrato) / 12) BETWEEN 10 AND 19 THEN salario_bruto * 1.08
        -- si lleva entre 10 y 19 años, se multiplica por 1.08 (8% mas)
        
        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, fecha_contrato) / 12) BETWEEN 5 AND 9 THEN salario_bruto * 1.05
        -- si lleva entre 5 y 9 años, se multiplica por 1.05 (5% mas)
        
        ELSE salario_bruto * 1.02
        -- en otro caso (menos de 5 años), se multiplica por 1.02 (2% mas)
    END
);

COMMIT;