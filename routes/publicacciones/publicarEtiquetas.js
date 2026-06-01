const express = require('express');
const router = express.Router();

const publicacionEtiquetaController = require('../controllers/publicacciones/publicacionEtiquetaController');
const { requireAuth } = require('../../middleware/auth');

// Asocio etiquetas a una publicación
router.post('/:publicacionId', requireAuth, publicacionEtiquetaController.guardar);

module.exports = router;