const Like = require('../../models/Like');
const Usuario = require('../../models/Usuario'); 
const Publicacion = require('../../models/Publicacion');
const Archivo = require('../../models/Archivo');



async function toggleLike(req, res) {
  try {
    if (!req.session.userId) {
      return res.redirect('/login');
    }

    const usuarioId = req.session.userId;

    const publicacionId = req.params.publicacionId;

    const likeExistente = await Like.findOne({
      where: {
        usuarioId: usuarioId,
        publicacionId: publicacionId
      }
    });

    if (likeExistente) {
      await likeExistente.destroy();
      return res.redirect('/');
    }

    
    await Like.create({
      usuarioId: usuarioId,
      publicacionId: publicacionId,
      fecha: new Date()
    });

   
    res.redirect('/');

  } catch (error) {
    console.error('Error al procesar like:', error);
    res.redirect('/');
  }
}

module.exports = {
  toggleLike
};