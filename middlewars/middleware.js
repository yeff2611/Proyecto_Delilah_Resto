const SECRET = "1234"; //Usar dotenv
const jwt = require('jsonwebtoken');

const validarTokenUserAdmin =  (req, res, next) => {
    const jwtToken = req.headers["authorization"];
    if(!jwtToken) {
        return res.status(401).json({msg: "usuario no valido"})
    }
    const jwtClient = jwtToken.split(" ")[1];
     // autorizacion mitoken
    jwt.verify(jwtClient,SECRET , (error, decoded) => {
        if(error) {
            return res.status(401).json({msg: "token invalido"})
        }
        console.log(decoded)
        if(decoded.tipoUsuario !== 1){
            return res.status(401).json({msg: "Operación inválida el usuario no es administrador"})
        }
        next()
    })
}

validarTokenUserViewer = (req, res, next) => {
    const jwtToken = req.headers["authorization"];
    if (!jwtToken) {
        return res.status(401).json({msg: "usuario no válido"});        
    }
    const jwtClient = jwtToken.split(" ")[1];
    jwt.verify(jwtClient, SECRET, (error, decoded) => {
        if (error) {
            return res.status(401).json({msg: "Token invalido"})
        }
        console.log(decoded);
        if (decoded.tipoUsuario !== 2) {
            return res.status(401).json({msg: "Usuario no puede realizar esta consulta"});
        }
        next();
    })
}

module.exports ={
    validarTokenUserAdmin, validarTokenUserViewer
}