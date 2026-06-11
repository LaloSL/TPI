const express = require('express');

const router = express.Router();

const moderacionController = require('../../controllers/moderacion/lista');

const {requireAuth, requireAdmin} = require('../../middleware/auth');

router.get('/', requireAuth, requireAdmin, moderacionController.listar);

router.post('/:publicacionId', requireAuth, requireAdmin, moderacionController.veredicto);

module.exports = router;