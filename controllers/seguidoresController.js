const Seguidor = require('../models/Seguidor');
const Usuario = require('../models/Usuario');
const Publicacion = require('../models/Publicacion');

const seguirUsuario = async (req, res) => {

  try {

    const seguidoId = req.params.id;
    const seguidorId = req.session.userId;

    if (seguidoId == seguidorId) {
      return res.redirect('/');
    }

    const yaExiste = await Seguidor.findOne({
      where: {
        seguidorId,
        seguidoId
      }
    });

    if (!yaExiste) {

      await Seguidor.create({
        seguidorId,
        seguidoId
      });

    }

    res.redirect('back');

  } catch (error) {

    console.error(error);
    res.send('Error al seguir usuario');

  }

};

const verPerfil = async (req, res) => {

  try {

    const usuario = await Usuario.findByPk(req.params.id, {
      include: [
        {
          model: Publicacion
        }
      ]
    });

    const seguidores = await Seguidor.count({
      where: {
        seguidoId: usuario.id
      }
    });

    const seguidos = await Seguidor.count({
      where: {
        seguidorId: usuario.id
      }
    });

    res.render('usuarios/perfil', {
      usuario,
      seguidores,
      seguidos
    });

  } catch (error) {

    console.error(error);
    res.send('Error al cargar perfil');

  }

};

module.exports = {
  seguirUsuario,
  verPerfil
};