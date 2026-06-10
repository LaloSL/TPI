const express = require('express');
const router = express.Router();

const interesadosController = require('../../controllers/intereses/interesadosController');
const { requireAuth } = require('../../middleware/auth');

// Ver usuarios interesados en mis publicaciones
router.get('/', requireAuth, interesadosController.listar);

module.exports = router;