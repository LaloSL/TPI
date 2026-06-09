const express = require('express');
const router = express.Router();

const valoracionController = require('../../controllers/comentarios/valoracionController');
const { requireAuth } = require('../../middleware/auth');


router.post('/:archivoId', requireAuth, valoracionController.guardar);

module.exports = router;