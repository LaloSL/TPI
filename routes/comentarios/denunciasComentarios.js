const express = require('express');
const router = express.Router();

const denunciasComentariosController = require('../controllers/comentarios/denunciasComentariosController');
const { requireAuth } = require('../middleware/auth');


router.post('/:comentarioId', requireAuth, denunciasComentariosController.guardar);

// Ver denuncias de comentarios recibidas
router.get('/', requireAuth, denunciasComentariosController.listar);

module.exports = router;