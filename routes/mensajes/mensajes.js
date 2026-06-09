const express = require('express');
const router = express.Router();

const mensajesController = require('../../controllers/mensajes/mensajesController');
const { requireAuth } = require('../../middleware/auth');

router.get('/', requireAuth, mensajesController.recibidos);

router.get('/:usuarioId', requireAuth, mensajesController.conversacion);

router.post('/:usuarioId', requireAuth, mensajesController.enviar);

module.exports = router;