const express = require('express');
const router = express.Router();
const orderController = require('../controllers/order.controllers');
const middleware = require('../middlewars/middleware')

router.get('/', orderController.getAll);
router.post('/registro', orderController.create);
router.put('/editar/:id', middleware.validarTokenUserAdmin, orderController.update);
router.delete('/eliminar/:id', middleware.validarTokenUserAdmin, orderController.deleteByID);

module.exports = router;