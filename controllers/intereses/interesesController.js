const Interes = require('../../models/Interes');
const Publicacion = require('../../models/Publicacion');
const Usuario = require('../../models/Usuario');
const Archivo = require('../../models/Archivo');

async function guardar(req, res) {

  try {

    const { publicacionId } = req.params;

    const usuarioInteresadoId =
      req.session.userId;

    const publicacion =
      await Publicacion.findByPk(
        publicacionId
      );

    if (!publicacion) {

      return res
        .status(404)
        .send(
          'Publicación no encontrada'
        );

    }

    if (
      publicacion.usuarioId ===
      usuarioInteresadoId
    ) {

      return res
        .status(403)
        .send(
          'No puedes interesarte en tu propia publicación'
        );

    }

    const interesExistente =
      await Interes.findOne({

        where: {
          usuarioInteresadoId,
          publicacionId
        }

      });

    if (interesExistente) {
     return res.redirect('/');
    }

    await Interes.create({

      usuarioInteresadoId,
      publicacionId

    });

    res.redirect('/');

  } catch (error) {

    console.error(
      'Error al registrar interés:',
      error
    );

    res
      .status(500)
      .send(
        'Error interno del servidor'
      );

  }

}

//intereses recibidos

async function listar(req, res) {

  try {

    const usuarioId =
      req.session.userId;

    const intereses =
      await Interes.findAll({

        include: [

          {
            model: Usuario,
            as: 'usuarioInteresado'
          },

          {
            model: Publicacion,
            include: [
              {
                model: Archivo
              }
            ]
          }

        ]

      });

    const interesesFiltrados =
      intereses.filter(interes => {

        return (
          interes.Publicacion &&
          interes.Publicacion.usuarioId === usuarioId
        );

      });

    res.render(
      'intereses/interesados',
      {
        intereses:
          interesesFiltrados,

        currentUser: {
          id: req.session.userId,
          nombre: req.session.nombre,
          rol: req.session.rol
        }
      }
    );

  } catch (error) {

    console.error(
      'Error al listar intereses:',
      error
    );

    res
      .status(500)
      .send(
        'Error interno del servidor'
      );

  }

}

module.exports = {
  guardar,
  listar
};