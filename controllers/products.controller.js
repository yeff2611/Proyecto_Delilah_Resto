const sequelize = require('../conexion');

const create = async (req, res) =>{
    const {nombre_producto, descripcion_producto, costo_producto} = req.body;
    let arrayInsertProduct = [`${nombre_producto}`, `${descripcion_producto}`, `${costo_producto}`];
    try {
        const queryResult = await sequelize.query('INSERT INTO tbl_producto (nombre_producto, descripcion_producto, costo_producto) VALUES(?, ?, ?)',        
        {replacements: arrayInsertProduct, type: sequelize.QueryTypes.INSERT})
        console.log(queryResult);
        res.status(201).json({queryResult})        
    } catch (error) {
        console.log(`Error al insertar el producto ${error}`);
    }
}

const getAll = async(req, res) =>{
    try {
        const queryResult = await sequelize.query(`SELECT * FROM tbl_producto`,
        {type: sequelize.QueryTypes.SELECT})
        
        console.log(queryResult);
        res.status(200).json({queryResult})
    } catch (error) {
        console.log(`Error al consultar los productos ${error}`);
        res.status(400).json({msg:"Ha ocurrido un error"})
    }
}

const getById = async(req, res) =>{
    try {
        const queryResult = await sequelize.query(`SELECT * FROM tbl_producto where id_producto = ${req.params.id}`,
        {type: sequelize.QueryTypes.SELECT})    
        console.log(queryResult);        
        res.status(200).json({queryResult});
    } catch (error) {
        console.log(`Error al consultar el producto ${error}`);
    }
}

const updateById = async(req, res) => {
    const {nombre_producto, descripcion_producto,costo_producto} = req.body;
    try {
        const queryResult = await sequelize.query(`UPDATE tbl_producto SET nombre_producto = "${nombre_producto}", descripcion_producto = "${descripcion_producto}", costo_producto = "${costo_producto}" WHERE id_producto = ${req.params.id}`, {type: sequelize.QueryTypes.UPDATE})

        console.log(queryResult);
        res.status(200).json({message: 'El producto se actualizó correctamente'});
        
    } catch (error) {
        console.log(`Error al actualizar el producto: ${error}`);
    }
}

const deleteById = async(req, res) =>{
    try {
        const queryResult = await sequelize.query(`DELETE FROM tbl_producto WHERE id_producto = ${req.params.id}`, {type: sequelize.QueryTypes.DELETE});
        res.status(200).json({
            message: 'Se ha eliminado el producto',
            queryResult
        })
    } catch (error) {
        console.log(`Error al eliminar el producto ${error}`);
    }
}

module.exports = {
    create, getAll, getById, updateById, deleteById
}