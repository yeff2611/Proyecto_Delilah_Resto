const express = require('express');
const router = express.Router();
const productController = require('../controllers/products.controller');
const middleware = require('../middlewars/middleware')

router.post('/', productController.create);
router.get('/', middleware.validarTokenAdmin, productController.getAll);
router.get('/:id', productController.getById);
router.put('/:id', productController.updateById);
router.delete('/:id',productController.deleteById);

module.exports = router;