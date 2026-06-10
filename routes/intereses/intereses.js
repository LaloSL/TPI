const express = require('express');
const router = express.Router();

const interesesController = require('../../controllers/intereses/interesesController');
const { requireAuth } = require('../../middleware/auth');

// Registrar interés en publicación
router.post('/:publicacionId', requireAuth, interesesController.guardar);

// Ver intereses recibidos en mis publicaciones
router.get('/mis-intereses', requireAuth, interesesController.listar);

module.exports = router;