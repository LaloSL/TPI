const express = require('express');
const router = express.Router();

const denunciasComentariosController = require('../../controllers/comentarios/denunciasComentariosController');
const { requireAuth } = require('../../middleware/auth');

router.post('/:comentarioId', requireAuth, denunciasComentariosController.guardar);

router.get('/', requireAuth, denunciasComentariosController.listar);

router.post('/eliminar/:comentarioId', requireAuth, denunciasComentariosController.eliminarComentario);

module.exports = router;