const express = require('express');

const router = express.Router();

const notificacionesController = require('../controllers/comentarios/notificacionesController');

const { requireAuth } = require('../middleware/auth');

router.get('/comentarios', requireAuth, notificacionesController.comentariosRecibidos);

router.get('/valoraciones', requireAuth, notificacionesController.valoracionesRecibidas);

router.get('/notificaciones', requireAuth, notificacionesController.verNotificaciones);

module.exports = router;