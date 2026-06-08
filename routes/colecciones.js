const express = require('express');

const router = express.Router();

const coleccionesController = require('../controllers/coleccionesController');

const { requireAuth } = require('../middleware/auth');


router.get('/', requireAuth, coleccionesController.listar);


router.get('/nueva', requireAuth, coleccionesController.formulario);


router.post('/nueva', requireAuth, coleccionesController.guardar);


router.post('/:id/eliminar', requireAuth, coleccionesController.eliminar);

router.get('/:id', requireAuth, coleccionesController.verColeccion);

router.post(
  '/:id/agregar/:publicacionId',
  requireAuth,
  coleccionesController.agregarPublicacion
);

module.exports = router;