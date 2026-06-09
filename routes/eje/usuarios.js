const express = require('express');
const usuariosController = require('../../controllers/eje/usuariosController');
const { requireAuth, requireAdmin } = require('../../middleware/auth');
const router = express.Router();

router.use(requireAuth);

router.get('/', usuariosController.listar);
router.post('/seguir/:id', usuariosController.seguirUsuario);
router.post('/dejar-seguir/:id', usuariosController.dejarDeSeguir);
router.get('/nuevo', requireAdmin, usuariosController.formulario);
router.post('/nuevo', requireAdmin, usuariosController.crear);

module.exports = router;