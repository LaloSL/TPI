const express = require('express');
const router = express.Router();

const denunciasController = require('../controllers/comentarios/denunciasController');
const { requireAuth } = require('../middleware/auth');


router.get('/:publicacionId', requireAuth, denunciasController.formulario);

router.post('/:publicacionId', requireAuth, denunciasController.guardar);

module.exports = router;