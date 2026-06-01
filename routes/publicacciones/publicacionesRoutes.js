const express = require('express');
const router = express.Router();

const publicacionesController = require('../controllers/publicacciones/publicacionesController');


function validarSesion(req, res, next) {
  if (!req.session.userId) {
    return res.redirect('/login');
  }

  next();
}

// habilitar o deshabilitar comentarios
router.post(
  '/:id/modificar-estado-comentarios',
  validarSesion,
  publicacionesController.modificarEstadoComentarios
);

module.exports = router;