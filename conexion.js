const Sequelize = require('sequelize');
require('dotenv').config();
const path = `mysql://root:${process.env.PASS_DB}@${process.env.USER}:3306/db_delilah_resto`;
const sequelize = new Sequelize(path, 
    {
        dialect: 'mysql',
        operatorAliases: 0,
        loggin: false
    });

sequelize.authenticate()
    .then(()=>{
        console.log('conectado correctamente');
    }).catch(err =>{
        console.error('Error de conexion', err);
    })

module.exports = sequelize;