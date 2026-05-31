const Usuario = require('../models/Usuario');
const Seguidor = require('../models/Seguidor');
const Publicacion = require('../models/Publicacion');
const Archivo = require('../models/Archivo');
const Notificacion = require('../models/Notificacion');



const { Op } = require('sequelize');

async function listar(req, res) {

  try {

    const usuarios = await Usuario.findAll();

    let siguiendo = [];

    // Buscar usuarios que sigue el usuario actual
    if (req.session.userId) {

      const seguidos = await Seguidor.findAll({

        where: {
          seguidorId: req.session.userId
        }

      });

      siguiendo = seguidos.map(
        s => s.seguidoId
      );

    }

    res.render('usuarios/lista', {

      usuarios,
      siguiendo

    });

  } catch (error) {

    console.error(error);

    res.status(500).render(
      'usuarios/lista',
      {
        error: 'Error al listar usuarios'
      }
    );

  }
}

async function formulario(req, res) {

  res.render('usuarios/formulario');

}

async function crear(req, res) {

  const usuario = req.body;

  if (
    !usuario.nombre ||
    !usuario.dni ||
    !usuario.email
  ) {

    return res.status(400).render(
      'usuarios/formulario',
      {
        error: 'Todos los campos son obligatorios'
      }
    );

  }

  try {

    const usuarioExistente =
      await Usuario.findOne({

        where: {

          [Op.or]: {

            dni: usuario.dni,
            email: usuario.email

          }

        }

      });

    if (usuarioExistente) {

      return res.status(400).render(
        'usuarios/formulario',
        {
          error: 'El usuario ya existe'
        }
      );

    }

    await Usuario.create(usuario);

    res.redirect('/usuarios');

  } catch (error) {

    console.error(error);

    res.status(500).render(
      'usuarios/formulario',
      {
        error: 'Error al crear el usuario'
      }
    );

  }
}


async function seguirUsuario(req, res) {

  try {

    const seguidorId =
      req.session.userId;

    const seguidoId =
      req.params.id;

    // Evitar seguirse a sí mismo
    if (seguidorId == seguidoId) {

      return res
        .status(400)
        .send(
          'No podés seguirte a vos mismo'
        );

    }

    // Verificar duplicados
    const yaExiste =
      await Seguidor.findOne({

        where: {
          seguidorId,
          seguidoId
        }

      });

    if (yaExiste) {

      return res
        .status(400)
        .send(
          'Ya seguís a este usuario'
        );

    }

    // Crear seguimiento
    await Seguidor.create({

      seguidorId,
      seguidoId

    });

    // Buscar nombre del seguidor
    const seguidor = await Usuario.findByPk(
      seguidorId
    );

    // Crear notificación
    await Notificacion.create({

      usuarioId: seguidoId,

      mensaje:
        '${seguidor.nombre} comenzó a seguirte'

    });

    res.redirect('/usuarios');

  } catch (error) {

    console.error(error);

    res
      .status(500)
      .send(
        'Error al seguir usuario'
      );

  }
}


async function dejarDeSeguir(req, res) {

  try {

    const seguidorId =
      req.session.userId;

    const seguidoId =
      req.params.id;

    await Seguidor.destroy({

      where: {
        seguidorId,
        seguidoId
      }

    });

    res.redirect('/usuarios');

  } catch (error) {

    console.error(error);

    res
      .status(500)
      .send(
        'Error al dejar de seguir'
      );

  }
}

const verPerfil = async (req, res) => {

  try {

    const usuario = await Usuario.findByPk(
      req.params.id,
      {
        include: [
          {
            model: Publicacion,
            include: [
              {
                model: Archivo
              }
            ]
          }
        ]
      }
    );

    console.log(usuario);

    if (!usuario) {
      return res.send('Usuario no encontrado');
    }

    res.render(
      'usuarios/perfil',
      {
        usuario
      }
    );

  } catch (error) {

    console.error(
      'ERROR EN PERFIL:',
      error
    );

    res.send('Error al cargar perfil');

  }

};

module.exports = {

  listar,
  formulario,
  crear,
  seguirUsuario,
  dejarDeSeguir,
  verPerfil
};
