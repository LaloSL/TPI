const express = require('express');
const router = express.Router();

const likeController = require('../../controllers/comentarios/likeController');

//toggleLike se encarga de agregar o quitar un like dependiendo si el usuario ya ha dado like a la publicación o no
router.post('/:publicacionId', likeController.toggleLike);

module.exports = router;