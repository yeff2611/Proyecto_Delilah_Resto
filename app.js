const express = require('express');
const app = express();
const sequelize = require('./conexion.js');
const PORT = 3000;

// Routes
const productRoute = require('./routers/products.routes');

app.use(express.json());

app.use('/api/product', productRoute)


app.listen(PORT, function(){
    console.log(`Sistema funcionando en el puerto ${PORT}`);
});

exports.app = app;