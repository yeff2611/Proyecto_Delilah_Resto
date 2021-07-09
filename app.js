const express = require('express');
const app = express();
const sequelize = require('./conexion.js');
const PORT = 3000;

const jwt = require("jsonwebtoken");

// Routes
const productRoute = require('./routers/products.routes');
const userRoute = require('./routers/user.routes');

app.use(express.json());

app.use('/api/product', productRoute);
app.use('/api/user', userRoute);


app.listen(PORT, function(){
    console.log(`Sistema funcionando en el puerto ${PORT}`);
});

exports.app = app;