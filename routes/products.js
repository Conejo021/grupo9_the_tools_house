const express = require('express');
const router = express.Router();
const guestMiddleware = require('../middlewares/guestMiddleware');
const authMiddleware = require('../middlewares/authMiddleware');

const productsController = require('../controllers/productsController')

router.get('/', productsController.todos);

router.get('/productDetail/:id', productsController.detalle);

router.get('/newProduct', productsController.nuevo);

router.get('/productCart', authMiddleware, productsController.carrito);


module.exports = router;