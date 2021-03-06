const { query } = require('express');
const sequelize = require('../conexion');
require('dotenv').config();
const jwt = require("jsonwebtoken");
const SECRET = process.env.SECRET; //Usar dotenv
const EXPIRES = "1h"; //dotenv


const getAll = async(req, res) =>{
    try {
        const queryResult = await sequelize.query(`SELECT * FROM tbl_usuario`, {
            type: sequelize.QueryTypes.SELECT
        });
        console.log(queryResult);
        res.status(200).json({queryResult});
    } catch (error) {
        console.log(error);
        res.status(400).json({msg:"Ha ocurrido un error"});
    }
}

const getById = async(req, res) =>{
    try {
        const queryResult = await sequelize.query(`SELECT nombre_usuario, nombre, apellido, email, telefono, direccion FROM tbl_usuario WHERE id_usuario = ${req.params.id}`, {
            type: sequelize.QueryTypes.SELECT
        });
        console.log(queryResult);
        res.status(200).json({queryResult});
    } catch (error) {
        console.log(error);
        res.status(400).json({msg:"Ha ocurrido un error"});
    }
}

const register = async(req, res) =>{
    const {nombre_usuario, contrasenia, nombre, apellido, email, telefono, direccion} = req.body;
    
    let arrayRegister = [`${nombre_usuario}`, `${contrasenia}`, `${nombre}`, `${apellido}`, `${email}`, `${telefono}`, `${direccion}`]

    try {
        if ( contrasenia.length < 6 || contrasenia.length > 15) {
            return res.status(400).json({msg:"El tamaño de la contraseña es invalida, la contraseña debe de tener minimo 6 caracteres y máximo 15"})
        }
        const queryResult = await sequelize.query('INSERT INTO tbl_usuario (nombre_usuario, contrasenia, nombre, apellido, email, telefono, direccion) VALUES(?,?,?,?,?,?,?)',
        {replacements: arrayRegister, type: sequelize.QueryTypes.INSERT});
        console.log(queryResult);
        res.status(200).json({msg: "Registro exitoso!"});
    } catch (error) {
        console.log(error);
        res.status(400).json({msg:"Ha ocurrido un error"})
    }
}

const login = async(req, res) => {
    const {email, contrasenia} = req.body;
    try {
        let queryResult = await sequelize.query(
            `SELECT * FROM tbl_usuario where email = "${email}" AND contrasenia = "${contrasenia}"`,
            {type: sequelize.QueryTypes.SELECT}
        );
        console.log(queryResult);
        queryResult = queryResult[0];
        if (queryResult) {
            let token = jwt.sign({
                email: queryResult.email, 
                tipoUsuario: queryResult.id_rol
            }, 
                SECRET,
                {expiresIn: EXPIRES}
            );
            return res.status(200).json({msg: "Bienvenido! " + queryResult.nombre, token});         
        }
        return res.status(404).json({msg:"Validar usuario y contraseña"});
    } catch (error) {
        console.log(error);
        res.status(400).json({msg: "Ha ocurrido un error, favor validar"})
    }
}

module.exports = {
    register, login, getById, getAll
}