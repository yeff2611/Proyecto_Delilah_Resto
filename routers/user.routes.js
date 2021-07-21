const express = require('express');
const router = express.Router();
const userController = require('../controllers/user.controllers');
const middleware = require('../middlewars/middleware')
// const { route } = require('./products.routes');

router.post('/register', userController.register);
router.post('/login', userController.login);
router.get('/:id', middleware.validarTokenUserAdmin, userController.getById);
router.get('/', middleware.validarTokenUserAdmin, userController.getAll);

module.exports = router;
