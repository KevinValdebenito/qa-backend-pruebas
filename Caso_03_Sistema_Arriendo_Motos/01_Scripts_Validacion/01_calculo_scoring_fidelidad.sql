DECLARE
    -- armamos el cursor para traer solo lo justo y necesario del cliente
    CURSOR cur_clientes IS
        SELECT NUMRUN_CLI, 
               DVRUN_CLI, 
               -- juntamos los nombres y apellidos, y limpiamos los espacios sobrantes
               TRIM(APPATERNO_CLI || ' ' || APMATERNO_CLI || ' ' || PNOMBRE_CLI || ' ' || NVL(SNOMBRE_CLI, '')) AS NOMBRE_CLIENTE
        FROM CLIENTE
        ORDER BY NUMRUN_CLI; 

    -- variables para atajar los datos que va soltando el cursor
    v_run           CLIENTE.NUMRUN_CLI%TYPE;
    v_dv            CLIENTE.DVRUN_CLI%TYPE;
    v_nombre        VARCHAR2(100);

    -- variables para guardar los cálculos matemáticos
    v_cant_arriendos NUMBER(5);
    v_tot_dias       NUMBER(6);
    v_monto_tot      NUMBER(14);
    v_puntaje        NUMBER(7);
    v_categoria      VARCHAR2(10);
    
    -- dejamos el año fijo en una variable para no tener que cambiarlo a mano en todos lados
    v_anno_proceso   NUMBER(4) := 2025;

BEGIN
    -- borramos los datos viejos de la tabla antes de meter los nuevos
    EXECUTE IMMEDIATE 'TRUNCATE TABLE SCORING_CLIENTE';

    -- abrimos el cursor y empezamos a dar vueltas por cada cliente
    OPEN cur_clientes;
    LOOP
        -- metemos los datos del cliente actual en nuestras variables
        FETCH cur_clientes INTO v_run, v_dv, v_nombre;
        
        -- si ya no quedan clientes, salimos del ciclo
        EXIT WHEN cur_clientes%NOTFOUND;

        -- bloque para calcular los totales del cliente
        BEGIN
            -- contamos arriendos, sumamos días y sacamos las lucas totales
            SELECT COUNT(a.ID_ARRIENDO),
                   NVL(SUM(a.DIAS_SOLICITADOS), 0),
                   NVL(SUM(m.VALOR_ARRIENDO_DIA * a.DIAS_SOLICITADOS), 0)
              INTO v_cant_arriendos, v_tot_dias, v_monto_tot
              FROM ARRIENDO_MOTO a 
              JOIN MOTOCICLETA m ON (a.PLACA = m.PLACA)
             WHERE a.NUMRUN_CLI = v_run
               AND EXTRACT(YEAR FROM a.FECHA_INI_ARRIENDO) = v_anno_proceso;
        EXCEPTION
            -- si el cliente no arrendó nada este año, dejamos todo en cero para que no tire error
            WHEN NO_DATA_FOUND THEN
                v_cant_arriendos := 0;
                v_tot_dias := 0;
                v_monto_tot := 0;
        END;

        -- revisamos qué categoría le toca según los arriendos
        IF v_cant_arriendos = 0 THEN
            v_puntaje := 0;
            v_categoria := 'Nuevo';
        ELSE
            -- aplicamos la fórmula de negocio y redondeamos el resultado
            v_puntaje := ROUND((v_cant_arriendos * 10) + (v_tot_dias * 3) + (v_monto_tot / 50000));

            -- asignamos la medalla según el puntaje
            IF v_puntaje >= 150 THEN
                v_categoria := 'Oro';
            ELSIF v_puntaje >= 60 AND v_puntaje <= 149 THEN
                v_categoria := 'Plata';
            ELSIF v_puntaje >= 1 AND v_puntaje <= 59 THEN
                v_categoria := 'Bronce';
            ELSE
                v_categoria := 'Nuevo';
            END IF;
        END IF;

        -- guardamos el resultado final de este cliente en la tabla
        INSERT INTO SCORING_CLIENTE (
            NUMRUN_CLI, DVRUN_CLI, NOMBRE_CLIENTE, ANNO_PROCESO,
            CANTIDAD_ARRIENDOS, TOTAL_DIAS, MONTO_TOTAL, PUNTAJE, CATEGORIA_FIDELIDAD
        ) VALUES (
            v_run, v_dv, v_nombre, v_anno_proceso,
            v_cant_arriendos, v_tot_dias, v_monto_tot, v_puntaje, v_categoria
        );

    END LOOP;

    CLOSE cur_clientes;
    COMMIT;
END;
/

-- miramos cómo quedó la tabla ordenada
SELECT * FROM SCORING_CLIENTE ORDER BY PUNTAJE;