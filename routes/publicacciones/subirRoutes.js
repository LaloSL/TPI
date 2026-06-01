const express = require('express');
const router = express.Router();
const subirController = require('../controllers/publicacciones/subirController');
const upload = require('../middleware/upload');

function validarSesion(req, res, next) {
  if (!req.session.userId) {
    return res.status(401).render('subir', {
      title: 'Subir publicación',
      error: 'Debes iniciar sesión para subir una publicación'
    });
  }

  next();
}

router.get('/', subirController.formulario);

router.post('/', validarSesion, upload.array('imagenes'), subirController.guardar);

module.exports = router;