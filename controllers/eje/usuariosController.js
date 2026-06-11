const bcrypt = require('bcrypt');

const Usuario = require('../../models/Usuario');
const Seguidor = require('../../models/Seguidor');
const Publicacion = require('../../models/Publicacion');
const Archivo = require('../../models/Archivo');
const Notificacion = require('../../models/Notificacion');

const { Op } = require('sequelize');

async function listar(req, res) {
  try {
    const usuarios = await Usuario.findAll();

    let siguiendo = [];

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

    res.status(500).render('usuarios/lista', {
      error: 'Error al listar usuarios'
    });
  }
}

async function formulario(req, res) {
  res.render('usuarios/formulario');
}

async function crear(req, res) {
  const usuario = req.body;

  const nombre = usuario.nombre ? usuario.nombre.trim() : '';
  const dni = usuario.dni ? usuario.dni.toString().trim() : '';
  const email = usuario.email ? usuario.email.trim().toLowerCase() : '';
  const password = usuario.password ? usuario.password.trim() : '';

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  if (
    !nombre ||
    !dni ||
    !email ||
    !password
  ) {
    return res.status(400).render('usuarios/formulario', {
      error: 'Todos los campos son obligatorios'
    });
  }

  if (nombre.length < 3) {
    return res.status(400).render('usuarios/formulario', {
      error: 'El nombre debe tener al menos 3 caracteres'
    });
  }

  if (!/^\d+$/.test(dni)) {
    return res.status(400).render('usuarios/formulario', {
      error: 'El DNI solo debe contener números'
    });
  }

  if (dni.length < 3) {
    return res.status(400).render('usuarios/formulario', {
      error: 'El DNI debe tener al menos 3 números'
    });
  }

  if (!emailRegex.test(email)) {
    return res.status(400).render('usuarios/formulario', {
      error: 'El correo electrónico no es válido'
    });
  }

  if (password.length < 6) {
    return res.status(400).render('usuarios/formulario', {
      error: 'La contraseña debe tener al menos 6 caracteres'
    });
  }

  try {
    const usuarioExistente = await Usuario.findOne({
      where: {
        [Op.or]: [
          { dni },
          { email }
        ]
      }
    });

    if (usuarioExistente) {
      return res.status(400).render('usuarios/formulario', {
        error: 'El usuario ya existe'
      });
    }

    const passwordHash = await bcrypt.hash(password, 10);

    await Usuario.create({
      nombre,
      email,
      dni,
      password: passwordHash,
      rol: 'usuario',
      estado: 'activo'
    });

    res.redirect('/login');

  } catch (error) {
    console.error(error);

    res.status(500).render('usuarios/formulario', {
      error: 'Error al crear el usuario'
    });
  }
}

async function seguirUsuario(req, res) {
  try {
    const seguidorId = req.session.userId;
    const seguidoId = req.params.id;

    if (seguidorId == seguidoId) {
      return res.status(400).send('No podés seguirte a vos mismo');
    }

    const yaExiste = await Seguidor.findOne({
      where: {
        seguidorId,
        seguidoId
      }
    });

    if (yaExiste) {
      return res.status(400).send('Ya seguís a este usuario');
    }

    await Seguidor.create({
      seguidorId,
      seguidoId
    });

    const seguidor = await Usuario.findByPk(seguidorId);

    await Notificacion.create({
      usuarioId: seguidoId,
      mensaje: `${seguidor.nombre} comenzó a seguirte`
    });

    res.redirect('/');

  } catch (error) {
    console.error(error);
    res.status(500).send('Error al seguir usuario');
  }
}

async function dejarDeSeguir(req, res) {
  try {
    const seguidorId = req.session.userId;
    const seguidoId = req.params.id;

    await Seguidor.destroy({
      where: {
        seguidorId,
        seguidoId
      }
    });

    res.redirect('/');

  } catch (error) {
    console.error(error);
    res.status(500).send('Error al dejar de seguir');
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

    if (!usuario) {
      return res.send('Usuario no encontrado');
    }

    res.render('usuarios/perfil', {
      usuario
    });

  } catch (error) {
    console.error('ERROR EN PERFIL:', error);
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