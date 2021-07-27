Proyecto Delilah Resto V 1.0

1. El proyecto contiene los archivos necesarios para ejecutar el proyecto (js, Dependencias, Base de datos)
2. Como primer paso se debe de crear la base de datos, para esto se deja el archivo Script_DB_Delilah.sql que contiene el query para crear y poblar las tablas.
También se adiciona backup, la cual se encuentra en el repositorio: Proyecto_Delilah\Script_BD.
3. Instalar: Express, nodemon(opcional), dotenv, npm, jsonwebtoken, mysql2, sequelize
4. Recomendable instalar Postman para probar la api

--------------------------------------------------------
----------------  BASE DE DATOS --------------------
--------------------------------------------------------
1. Ruta Base de datos (Backup y script de creación) "Proyecto_Delilah\Script_BD"
2. Base de datos creada en MySql
3. Población base de datos, orden de cargue de las tablas:
    - tbl_estado
    - tbl_tipo_pago
    - tbl_rol
    - tbl_producto
    - tbl_usuario
    - tbl_pedido
    - tbl_pedido_producto

--------------------------------------------------------
---------------- EJECUCIÓN SERVER API ------------------
--------------------------------------------------------
1. Modificar parámetros de conexión a base de datos:
    - Ruta de parámetros: en la siguiente ruta se encuentran los parámetros de conexión a la base de datos "Proyecto_Delilah/.env"
    - Parámetros de conexión: USER, PASS_DB, modificarlos de acuerdo a la configuración de la base de datos.
    - Detalles de cofiguración de la base de datos: para mas detalle consultar el archivo conexion.js, ubicado en la siguiente ruta: "Proyecto_Delilah/conexion.js"
2. Resstablecer backup o ejecutar scrip de creación de base da datos
3. Ejecutar archivo js app.js, ubicado en la siguiente ruta "Proyecto_Delilah/app.js"
4. Antes de hacer pruebas es necesario revisar el archivo de documentación de la API creado en swagger el cual se encuentra ubicado en la siguiente ruta: "Proyecto_Delilah/Documentacion_Swagger/Proyecto_Delilah_YeffersonV.yaml"
5. Crear Request según documentación Swagger y ejecutar