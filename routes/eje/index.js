const express = require('express');
const router = express.Router();
const { authenticateUser, logout } = require('../../middleware/auth');
const indexController = require('../../controllers/eje/indexController');
const usuariosController = require('../../controllers/eje/usuariosController');
const notificacionesController = require('../../controllers/notificaciones/notificacionesController');

router.get('/', indexController.inicio);
router.get('/login', (req, res) => {
  if (req.session.userId) {
    return res.redirect('/');
  }

  res.render('login');
});

router.post('/login', authenticateUser, (req, res) => {
  res.redirect('/');
});

router.get('/registro', usuariosController.formulario);
router.post('/registro', usuariosController.crear);
router.get('/notificaciones', notificacionesController.nuevosSeguidores);
router.get('/logout', logout);

module.exports = router;