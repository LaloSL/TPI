const express = require('express');
const administradorController = require('../../controllers/eje/administradorController');
const { requireAuth, requireAdmin } = require('../../middleware/auth');

const router = express.Router();

// SOLO admin puede entrar a todo esto
router.use(requireAdmin);

// Listar usuarios
router.get('/', administradorController.listar);

//hacer usuario admin
router.post('/:id/hacer-admin', administradorController.hacerAdmin);

//quitar admin 
router.post('/:id/quitar-admin', administradorController.quitarAdmin);

module.exports = router;
