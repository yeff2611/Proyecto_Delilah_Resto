const express = require('express');
const router = express.Router();
const userController = require('../controllers/user.controllers');
const { route } = require('./products.routes');

router.post('/register', userController.register);
router.post('/login', userController.login);

module.exports = router;
