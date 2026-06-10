const Comentario = require('../../models/Comentario');
const Valoracion = require('../../models/Valoracion');
const Usuario = require('../../models/Usuario');
const Publicacion = require('../../models/Publicacion');
const Archivo = require('../../models/Archivo');
const Notificacion = require('../../models/Notificacion');
const Seguidor = require('../../models/Seguidor');

async function comentariosRecibidos(req, res) {
  try {

    const usuarioId = req.session.userId;

    const comentarios = await Comentario.findAll({
      include: [
        {
          model: Usuario
        },
        {
          model: Publicacion
        }
      ],
      order: [['createdAt', 'DESC']]
    });

    const comentariosFiltrados = comentarios.filter(c => {
      return (
        c.Publicacion &&
        c.Publicacion.usuarioId === usuarioId
      );
    });

    res.render('comentarios/comentariosRecibidos', {
      comentarios: comentariosFiltrados
    });

  } catch (error) {

    console.error(
      'Error al cargar comentarios recibidos:',
      error
    );

    res
      .status(500)
      .send('Error al cargar comentarios recibidos');
  }
}

async function valoracionesRecibidas(req, res) {
  try {

    const usuarioId = req.session.userId;

    const valoraciones = await Valoracion.findAll({
      include: [
        {
          model: Usuario
        },
        {
          model: Archivo,
          include: [
            {
              model: Publicacion
            }
          ]
        }
      ],
      order: [['createdAt', 'DESC']]
    });

    const valoracionesFiltradas = valoraciones.filter(v => {
      return (
        v.Archivo &&
        v.Archivo.Publicacion &&
        v.Archivo.Publicacion.usuarioId === usuarioId
      );
    });

    res.render('comentarios/valoracionesRecibidas', {
      valoraciones: valoracionesFiltradas
    });

  } catch (error) {

    console.error(
      'Error al cargar valoraciones recibidas:',
      error
    );

    res
      .status(500)
      .send('Error al cargar valoraciones recibidas');
  }
}

async function nuevosSeguidores(req, res) {

  try {

    const usuarioId = req.session.userId;

    const notificaciones =
      await Notificacion.findAll({

        where: {
          usuarioId
        },

        order: [
          ['createdAt', 'DESC']
        ]

      });

    res.render('nuevoSeguidores', {
      notificaciones
    });

  } catch (error) {

    console.error(
      'Error al cargar notificaciones:',
      error
    );

    res
      .status(500)
      .send(
        'Error al cargar notificaciones'
      );
  }
}

async function verNotificaciones(req, res) {

  try {

    const usuarioId = req.session.userId;

    const notificaciones =
      await Notificacion.findAll({

        where: {
          usuarioId
        },

        order: [
          ['createdAt', 'DESC']
        ]

      });

    res.render('notificaciones', {
      notificaciones
    });

  } catch (error) {

    console.error(error);

    res
      .status(500)
      .send(
        'Error al cargar notificaciones'
      );
  }
}

module.exports = {
  comentariosRecibidos,
  valoracionesRecibidas,
  nuevosSeguidores,
  verNotificaciones
};