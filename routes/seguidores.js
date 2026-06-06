const express = require('express');
const router = express.Router();
const { seguirUsuario,verPerfil } = require('../controllers/seguidoresController');
const { requireAuth } = require('../middleware/auth');

router.post('/:id', requireAuth, seguirUsuario);
router.get('/perfil/:id', verPerfil);

module.exports = router;