const SECRET = "1234"; //Usar dotenv
const jwt = require('jsonwebtoken');

const validarTokenAdmin =  (req, res, next) => {
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
            return res.status(401).json({msg: "Usuario no es administrador"})
        }
        next()
    })
}

module.exports ={
    validarTokenAdmin
}