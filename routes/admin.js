const express = require('express');
const router = express.Router();
const multer = require('multer');
const adminController = require('../controllers/adminController');
const path = require('path');
const { route } = require('.');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, path.resolve(__dirname, '../public/imagenes/products'));
    },
    filename: function (req, file, cb) {
      cb(null, 'product-'+Date.now()+path.extname(file.originalname))
    }
  })
   
  const upload = multer({ storage })

router.get('/', adminController.index);
router.get('/create', adminController.create);
router.post('/create', upload.single('imagen'), adminController.save);
router.get('/detail/:id', adminController.show);
router.get('/edit/:id', adminController.edit);
router.put('/edit/:id', upload.single('imagen'), adminController.update);
router.get('/delete/:id', adminController.destroy);

module.exports = router;
