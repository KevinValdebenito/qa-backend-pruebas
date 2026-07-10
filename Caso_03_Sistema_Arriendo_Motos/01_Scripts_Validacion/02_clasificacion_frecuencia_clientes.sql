DECLARE
    -- mismo cursor de arriba: traemos el rut y el nombre limpiecito
    CURSOR cur_clientes IS
        SELECT NUMRUN_CLI, 
               DVRUN_CLI, 
               TRIM(APPATERNO_CLI || ' ' || APMATERNO_CLI || ' ' || PNOMBRE_CLI || ' ' || NVL(SNOMBRE_CLI, '')) AS NOMBRE_CLIENTE
        FROM CLIENTE
        ORDER BY NUMRUN_CLI;

    -- variables para recibir los datos del rut y nombre
    v_run           CLIENTE.NUMRUN_CLI%TYPE;
    v_dv            CLIENTE.DVRUN_CLI%TYPE;
    v_nombre        VARCHAR2(100);

    -- variables para saber cuántas veces arrendó y qué categoría le damos
    v_cant_arriendos NUMBER(5);
    v_categoria      VARCHAR2(15);
    v_anno_proceso   NUMBER(4) := 2025;

BEGIN
    -- borramos todo lo viejo de la tabla de clasificación
    EXECUTE IMMEDIATE 'TRUNCATE TABLE CLASIFICACION_CLIENTE';

    -- abrimos el cursor para empezar a leer
    OPEN cur_clientes;
    LOOP
        -- sacamos los datos del cliente de turno
        FETCH cur_clientes INTO v_run, v_dv, v_nombre;

        -- si ya leímos todos, cortamos el ciclo
        EXIT WHEN cur_clientes%NOTFOUND;

        -- bloque para contar los arriendos del cliente
        BEGIN
            -- contamos cuántos arriendos tiene en el año que nos interesa
            SELECT COUNT(ID_ARRIENDO)
              INTO v_cant_arriendos
              FROM ARRIENDO_MOTO
             WHERE NUMRUN_CLI = v_run
               AND EXTRACT(YEAR FROM FECHA_INI_ARRIENDO) = v_anno_proceso;
        EXCEPTION
            -- si no hay datos, le ponemos 0 arriendos y listo
            WHEN NO_DATA_FOUND THEN
                v_cant_arriendos := 0;
        END;

        -- vemos qué etiqueta le ponemos según los arriendos que tuvo
        IF v_cant_arriendos >= 4 THEN
            v_categoria := 'Frecuente';
        ELSIF v_cant_arriendos >= 1 AND v_cant_arriendos <= 3 THEN
            v_categoria := 'Ocasional';
        ELSE
            v_categoria := 'Nuevo';
        END IF;

        -- insertamos el cliente clasificado en la tabla final
        INSERT INTO CLASIFICACION_CLIENTE (
            NUMRUN_CLI, DVRUN_CLI, NOMBRE_CLIENTE, ANNO_PROCESO,
            CANTIDAD_ARRIENDOS, CATEGORIA_CLIENTE
        ) VALUES (
            v_run, v_dv, v_nombre, v_anno_proceso,
            v_cant_arriendos, v_categoria
        );

    END LOOP;
    
    CLOSE cur_clientes;
    COMMIT;
END;
/

-- echamos una mirada a los resultados ordenados del que más arrendó al que menos
SELECT * FROM CLASIFICACION_CLIENTE ORDER BY CANTIDAD_ARRIENDOS DESC;