const express = require('express');
const app = express();
const sequelize = require('./conexion.js');

async function consultaDB() {
    sequelize.query("select * from tbl_tipo_pago", {
        type:sequelize.QueryTypes.SELECT
    }).then(estados =>{
        console.log(estados);
    }).catch(error =>{
        console.log("Ha ocurrido un error: " + error);
    })
}

consultaDB();

app.listen(3000, function(){
    console.log("Sistema funcionando en el puerto 3000");
});