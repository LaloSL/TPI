const Publicacion = require('../models/Publicacion');
async function modificarEstadoComentarios(req, res) {

  try {
    const publicacionId = req.params.id;
    const usuarioId = req.session.userId;

    //Busca publicacion
    const publicacion = await Publicacion.findByPk(publicacionId);

    if (!publicacion) {

      return res.status(404).send('Publicación no encontrada');
    }

    if (publicacion.usuarioId !== usuarioId) {

      return res.status(403).send('No tienes permiso para modificar esta publicación');
    }

    publicacion.comentarios_habilitados =
      !publicacion.comentarios_habilitados;
    await publicacion.save();
    res.redirect('/');

  } catch (error) {

    console.error('Error al modificar estado de comentarios:', error);

    res.status(500).send('Error interno del servidor');
  }
}

module.exports = {
  modificarEstadoComentarios
};