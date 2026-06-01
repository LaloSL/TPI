const bcrypt = require('bcrypt');
const Usuario = require('../models/Usuario');

// verifica que el usuario esta autenticado
const requireAuth = (req, res, next) => {
  if (!req.session.userId) {
    return res.redirect('/login');
  }
  next();
};

//validacion del login
const authenticateUser = async (req, res, next) => {
  try {
    const { dni, password } = req.body;

    if (!dni || !password) {
      return res.render('login', {
        error: 'DNI y contraseña son requeridos'
      });
    }

    // Busca usuario X DNI
    const usuario = await Usuario.findOne({
      where: { dni: dni }
    });

    if (!usuario) {
      return res.render('login', {
        error: 'DNI o contraseña incorrectos'
      });
    }

    // Verifica contraseña
    const passwordValida = await usuario.validarPassword(password);

    if (!passwordValida) {
      return res.render('login', {
        error: 'DNI o contraseña incorrectos'
      });
    }

    //info del usuario logeado
    req.session.userId = usuario.id;
    req.session.dni = usuario.dni;
    req.session.nombre = usuario.nombre;
    req.session.rol = usuario.rol;

    // Continuar al siguiente middleware o ruta
    next();

  } catch (error) {
    console.error('Error en autenticación:', error);
    return res.render('login', {
      error: 'Error interno del servidor'
    });
  }
};

// info usuario actual
const getCurrentUser = async (req, res, next) => {
  if (req.session.userId) {
    try {
      const usuario = await Usuario.findByPk(req.session.userId);
      req.currentUser = usuario;
      res.locals.currentUser = usuario;
    } catch (error) {
      console.error('Error obteniendo usuario actual:', error);
    }
  }
  next();
};


// usuario tiene rol de admin
const requireAdmin = (req, res, next) => {
  if (!req.session.userId || req.session.rol !== 'admin') {
    return res.status(403).send('Acceso denegado');
  }
  next();
};

//salir
const logout = (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      console.error('Error al cerrar sesión:', err);
      return res.status(500).send('Error al cerrar sesión');
    }
    res.clearCookie('connect.sid'); // Nombre por defecto de la cookie de sesión
    res.redirect('/login');
  });
};

module.exports = {
  requireAuth,
  requireAdmin,
  authenticateUser,
  getCurrentUser,
  logout
};