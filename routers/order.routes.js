const express = require('express');
const router = express.Router();
const orderController = require('../controllers/order.controllers');

router.get('/', orderController.getAll);
router.post('/registro', orderController.create);

module.exports = router;