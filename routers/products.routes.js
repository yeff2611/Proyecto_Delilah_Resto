const express = require('express');
const router = express.Router();
const productController = require('../controllers/products.controller');
const middleware = require('../middlewars/middleware')

router.post('/registro', productController.create);
router.get('/', productController.getAll);
router.get('/:id', productController.getById);
router.put('/editar/:id', middleware.validarTokenUserAdmin, productController.updateById);
router.delete('/eliminar/:id', middleware.validarTokenUserAdmin, productController.deleteById);

module.exports = router;