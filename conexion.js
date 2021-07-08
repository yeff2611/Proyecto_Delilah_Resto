const Sequelize = require('sequelize');
const path = 'mysql://root:sa@localhost:3306/db_delilah_resto';
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