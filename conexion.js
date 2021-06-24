const Sequelize = require('sequelize');
const path = 'mysql://root:sa@localhost:3306/db_delilah_resto';
const sequelize = new Sequelize(path, {operatorAliases: false});

sequelize.authenticate().then(()=>{
    console.log('conectado correctamente');
}).catch(err =>{
    console.error('Error de conexion', err);
}).finally(()=>{
    sequelize.close();
});

module.exports = sequelize;