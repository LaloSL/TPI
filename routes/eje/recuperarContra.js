const express = require('express');
const recuperarController = require('../controllers/eje/recuperarController');

const router = express.Router();

router.get('/', recuperarController.formulario);
router.post('/', recuperarController.recuperar);
module.exports = router;