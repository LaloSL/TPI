const DenunciaComentario = require('../../models/DenunciaComentario');
const Comentario = require('../../models/Comentario');
const Usuario = require('../../models/Usuario');
const Publicacion = require('../../models/Publicacion');

async function guardar(req, res) {
  try {
    const { comentarioId } = req.params;
    const usuarioId = req.session.userId;

    if (!usuarioId) {
      return res.redirect('/login');
    }

    const comentario = await Comentario.findByPk(comentarioId);

    if (!comentario) {
      return res.status(404).send('Comentario no encontrado');
    }

    const denunciaExistente = await DenunciaComentario.findOne({
      where: {
        usuarioId,
        comentarioId
      }
    });

    if (denunciaExistente) {
      return res.redirect('/');
    }

    await DenunciaComentario.create({
      motivo: 'comentario_inapropiado',
      descripcion: 'Comentario denunciado por un usuario',
      usuarioId,
      comentarioId,
      estado: 'pendiente'
    });

    res.redirect('/');

  } catch (error) {
    console.error('Error al guardar denuncia de comentario:', error);
    res.status(500).send('Error al guardar denuncia de comentario');
  }
}

async function listar(req, res) {
  try {
    const usuarioId = req.session.userId;
    const currentUser = res.locals.currentUser;

    const denuncias = await DenunciaComentario.findAll({
      include: [
        {
          model: Comentario,
          include: [
            {
              model: Usuario
            },
            {
              model: Publicacion
            }
          ]
        },
        {
          model: Usuario
        }
      ],
      order: [['createdAt', 'DESC']]
    });

    const denunciasFiltradas = denuncias.filter(denuncia => {
      if (!denuncia.Comentario || !denuncia.Comentario.Publicacion) {
        return false;
      }

      if (denuncia.Comentario.estadoComentario !== 'activo') {
        return false;
      }

      if (currentUser && currentUser.rol === 'admin') {
        return true;
      }

      return Number(denuncia.Comentario.Publicacion.usuarioId) === Number(usuarioId);
    });

    res.render('comentarios/denunciasComentarios', {
      denuncias: denunciasFiltradas
    });

  } catch (error) {
    console.error('Error al listar denuncias de comentarios:', error);
    res.status(500).send('Error al listar denuncias');
  }
}

async function eliminarComentario(req, res) {
  try {
    const { comentarioId } = req.params;
    const usuarioId = req.session.userId;
    const currentUser = res.locals.currentUser;

    const comentario = await Comentario.findByPk(comentarioId, {
      include: [
        {
          model: Publicacion
        }
      ]
    });

    if (!comentario) {
      return res.status(404).send('Comentario no encontrado');
    }

    const esAdmin = currentUser && currentUser.rol === 'admin';

    const esDueñoPublicacion =
      comentario.Publicacion &&
      Number(comentario.Publicacion.usuarioId) === Number(usuarioId);

    if (!esAdmin && !esDueñoPublicacion) {
      return res.status(403).send('No tenés permiso para eliminar este comentario');
    }

    await Comentario.update(
      {
        estadoComentario: 'eliminado'
      },
      {
        where: {
          id: comentarioId
        }
      }
    );

    await DenunciaComentario.update(
      {
        estado: 'resuelta'
      },
      {
        where: {
          comentarioId
        }
      }
    );

    res.redirect('/denuncias-comentarios');

  } catch (error) {
    console.error('Error al eliminar comentario denunciado:', error);
    res.status(500).send('Error al eliminar comentario denunciado');
  }
}

module.exports = {
  guardar,
  listar,
  eliminarComentario
};
