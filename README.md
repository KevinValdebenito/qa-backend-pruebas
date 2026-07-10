# QA Backend & Database Testing Portfolio (Oracle PL/SQL)

Bienvenido a mi portafolio de pruebas y validación de arquitectura de datos. Este repositorio contiene *scripts* y módulos desarrollados para asegurar la integridad, seguridad y rendimiento de bases de datos relacionales, simulando entornos de negocio reales.

### Tecnologías y Herramientas
* **Lenguajes:** Oracle PL/SQL, SQL.
* **Conceptos aplicados:** Cursores (Batch processing), Vistas de solo lectura, Funciones Analíticas, DML y DDL, Optimización de Rendimiento (Índices), y Reglas de Negocio.
* **Arquitectura:** Entornos estructurados y reproducibles (separación de *Setup* y *Scripts* de validación).

---

## Casos de Estudio y Validaciones Implementadas

Para garantizar la reproducibilidad técnica, cada caso de estudio está dividido en dos secciones: el entorno de despliegue de la base de datos (`00_Setup_BD`) y los scripts de lógica de negocio desarrollados (`01_Scripts_Validacion`).

### Caso 1: Gestión Operativa y Bonificaciones (Rent a Moto)
* **Objetivo:** Generar reportes operativos de la flota de vehículos y automatizar el cálculo de bonificaciones para empleados.
* **Validación y Desarrollo:** * Uso de condicionales lógicos (`CASE`) para la manipulación y cruce de cadenas de texto (generación de correos corporativos automáticos).
    * Creación de tablas históricas (`CREATE TABLE AS SELECT`) utilizando funciones de agregación (`COUNT`, `SUM`).
    * Cálculo de bonos salariales mediante subconsultas complejas y cruces de múltiples entidades relacionales.

### Caso 2: Gestión de RRHH y Optimización de Consultas
* **Objetivo:** Optimizar la extracción de información, configurar la seguridad del entorno de datos y procesar reajustes masivos.
* **Validación y Desarrollo:** * Actualización masiva de datos (`UPDATE`) aplicando reglas matemáticas de reajuste salarial según antigüedad laboral (uso de `MONTHS_BETWEEN`).
    * Creación de vistas protegidas (`WITH READ ONLY`) y uso de funciones analíticas (`OVER PARTITION BY`) para reportes de gestión de proyectos. 
    * Implementación de Índices (`CREATE INDEX`) para optimizar los planes de ejecución y reducir los tiempos de respuesta en consultas críticas.

### Caso 3: Motor de Scoring y Fidelidad de Clientes (Rent a Moto)
* **Objetivo:** Automatizar la evaluación y categorización de la cartera de clientes basada en su volumen transaccional histórico.
* **Validación y Desarrollo:** * Desarrollo de procesos *Batch* mediante bloques anónimos y **Cursores** en PL/SQL (`OPEN`, `FETCH`, `CLOSE`).
    * Implementación de manejo de excepciones (`NO_DATA_FOUND`) para mantener la integridad del proceso.
    * Validación lógica transaccional para calcular y asignar dinámicamente etiquetas de frecuencia ("Frecuente", "Ocasional") y categorías de fidelidad ("Oro", "Plata", "Bronce").
