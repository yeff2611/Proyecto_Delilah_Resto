const sequelize = require('../conexion');

const create = async (req, res) => {
    const {descripcion_pedido, id_usuario, id_tipo_pago, pedido_producto} = req.body;

    let arrayPedido = [`${descripcion_pedido}`, `${id_usuario}`, `${id_tipo_pago}`];

    try {
        /*inserta la orden*/
        const queryResult = await sequelize.query('INSERT INTO tbl_pedido(descripcion_pedido, id_usuario, id_tipo_pago) VALUES (?,?,?)',
        {
            replacements: arrayPedido,
            type: sequelize.QueryTypes.INSERT
        });
        //Captura el id del pedido creado
        let idPedido = queryResult[0];
        let stringQuery;
        let stringNewQuery = "";

        /*Arma string de productos para la orden*/
        async function insertOrderProduct(element, index, array){
            stringQuery = `(${idPedido},${array[index].id_producto},${array[index].cantidad}),`
            stringNewQuery += stringQuery;
        }
        
        pedido_producto.forEach(insertOrderProduct);
        QueryString = stringNewQuery.substring(0, stringNewQuery.length-1)

        /*Query Inserccion Ordenes productos*/
        const queryInsertOrderProduct = await sequelize.query("INSERT INTO tbl_pedido_producto(id_pedido, id_producto, cantidad) VALUES " + QueryString,
        {
            type: sequelize.QueryTypes.INSERT
        });
        
        console.log(queryInsertOrderProduct);
        res.status(200).json({msg: "Registro exitoso!"})
    } catch (error) {
        console.log(`Error al insertar: ${error}`);
        res.status(400).json({msg: "Ha ocurrido un error"})
    }
}

const update = async (req, res) =>{
    const {descripcion_pedido, id_estado, id_tipo_pago} = req.body;

    try {
        const queryResult = await sequelize.query(`UPDATE tbl_pedido set descripcion_pedido = "${descripcion_pedido}" , id_estado = ${id_estado},id_tipo_pago = ${id_tipo_pago} WHERE id_pedido = ${req.params.id}`, 
        {
            type: sequelize.QueryTypes.UPDATE
        });
        console.log(queryResult);
        res.status(200).json({msg: "El pedido se actualizó correctamente"});
    } catch (error) {
        console.log(error);
        res.status(400).json({msg: "Ha ocurrido un error"})
    }
}

const deleteByID = async (req, res) => {
    try {
        const queryResult = await sequelize.query(`DELETE FROM tbl_pedido where id_pedido = ${req.params.id}`,
        {
            type: sequelize.QueryTypes.DELETE
        });
        res.status(200).json({
            msg: "El pedido se eliminó correctamente",            
        })
    } catch (error) {
        console.log(error);
        res.status(400).json({msg: "Ha ocurrido un error"});
    }
}

const getAll = async (req, res) => {
    try {
        const queryResult = await sequelize.query('SELECT ped.id_pedido, ped.descripcion_pedido, est.descripcion_estado as Estado_Pedido ,tpago.nombre_tipo_pago, prod.id_producto, prod.nombre_producto, prod.descripcion_producto, prod.costo_producto, ped_prod.cantidad,  (prod.costo_producto*ped_prod.cantidad) as Precio_Total, usu.nombre_usuario, usu.email, usu.telefono, usu.direccion, ped.fecha_pedido FROM tbl_pedido ped LEFT JOIN tbl_pedido_producto ped_prod using(id_pedido) LEFT JOIN tbl_producto prod using(id_producto) LEFT JOIN tbl_usuario usu using(id_usuario) LEFT JOIN tbl_estado est using(id_estado) left join tbl_tipo_pago tpago using(id_tipo_pago) WHERE prod.nombre_producto is not null order by ped.id_pedido' , {
            type: sequelize.QueryTypes.SELECT
        })
        console.log(queryResult);
        res.status(200).json({queryResult});
    } catch (error) {
        console.log(`Error al consultar pedidos: ${error}`);
        res.status(400).json({msg: "ha ocurrido un error"});
    }
}

module.exports = {
    getAll, create, update, deleteByID
}