const sequelize = require('../conexion');


const create = async (req, res) => {
    const {descripcion_pedido, id_usuario, id_tipo_pago, pedido_producto} = req.body;

    let arrayPedido = [`${descripcion_pedido}`, `${id_usuario}`, `${id_tipo_pago}`];
    console.log(pedido_producto);

    try {
        const queryResult = await sequelize.query('INSERT INTO tbl_pedido(descripcion_pedido, id_usuario, id_tipo_pago) VALUES (?,?,?)',
        {
            replacements: arrayPedido,
            type: sequelize.QueryTypes.INSERT
        });
        let idPedido = queryResult[0];

        /*Inserta productos a la orden*/
        async function indexArray(element, index, array){
            const queryInsertOrderProduct = await sequelize.query(`INSERT INTO tbl_pedido_producto(id_pedido, id_producto, cantidad) VALUES (${idPedido},${pedido_producto[index].id_producto},${pedido_producto[index].cantidad})`, 
            {
                type: sequelize.QueryTypes.INSERT
            })
            console.log(queryInsertOrderProduct);
        }
        pedido_producto.forEach(indexArray);
        console.log(queryResult);        
        res.status(200).json({msg: "Registro exitoso!"})
    } catch (error) {
        console.log(`Error al insertar: ${error}`);
        res.status(400).json({msg: "Ha ocurrido un error"})
    }
}

const getAll = async (req, res) => {
    try {
        const queryResult = await sequelize.query('SELECT ped.id_pedido, ped.descripcion_pedido, est.descripcion_estado as Estado_Pedido ,tpago.nombre_tipo_pago, prod.nombre_producto, prod.descripcion_producto, prod.costo_producto, ped_prod.cantidad,  (prod.costo_producto*ped_prod.cantidad) as Precio_Total, usu.nombre_usuario, usu.email, usu.telefono, usu.direccion, ped.fecha_pedido FROM tbl_pedido ped LEFT JOIN tbl_pedido_producto ped_prod using(id_pedido) LEFT JOIN tbl_producto prod using(id_producto) LEFT JOIN tbl_usuario usu using(id_usuario) LEFT JOIN tbl_estado est using(id_estado) left join tbl_tipo_pago tpago using(id_tipo_pago) WHERE prod.nombre_producto is not null order by ped.id_pedido' , {
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
    getAll, create
}