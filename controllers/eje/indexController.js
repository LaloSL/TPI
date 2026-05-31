const Publicacion = require('../../models/Publicacion');
const Usuario = require('../../models/Usuario');
const Archivo = require('../../models/Archivo');
const Like = require('../../models/Like');
const Comentario = require('../../models/Comentario');
const Valoracion = require('../../models/Valoracion');
const Etiqueta = require('../../models/Etiqueta');

// CALCULAR DATOS DE VALORACIÓN
function calcularDatosValoracion(publicacion) {
  let suma = 0;
  let cantidad = 0;

  if (publicacion.Archivos && publicacion.Archivos.length > 0) {
    publicacion.Archivos.forEach(archivo => {
      if (archivo.Valoracions && archivo.Valoracions.length > 0) {
        archivo.Valoracions.forEach(valoracion => {
          suma += valoracion.valor;
          cantidad++;
        });
      }
    });
  }

  const promedio = cantidad > 0 ? suma / cantidad : 0;

  return {
    promedio,
    cantidad
  };
}

// Controller del inicio (home)
async function inicio(req, res) {
  try {
    const publicacionesDB = await Publicacion.findAll({
      include: [
        { model: Usuario },
        {
          model: Archivo,
          include: [{ model: Valoracion }]
        },
        { model: Like },
        {
          model: Comentario,
          include: [{ model: Usuario }]
        },
        { model: Etiqueta }
      ],
      order: [['id', 'DESC']]
    });

    const publicaciones = publicacionesDB.sort((a, b) => {
      const datosA = calcularDatosValoracion(a);
      const datosB = calcularDatosValoracion(b);

      const aCalificada = datosA.cantidad >= 3;
      const bCalificada = datosB.cantidad >= 3;

      if (aCalificada && !bCalificada) {
        return -1;
      }

      if (!aCalificada && bCalificada) {
        return 1;
      }

      if (datosB.promedio !== datosA.promedio) {
        return datosB.promedio - datosA.promedio;
      }

      return datosB.cantidad - datosA.cantidad;
    });

    const currentUser = req.session.userId
      ? {
          id: req.session.userId,
          nombre: req.session.nombre,
          rol: req.session.rol
        }
      : null;

    res.render('home', {
      publicaciones,
      currentUser
    });

  } catch (error) {
    console.error('ERROR AL CARGAR HOME:', error);

    const currentUser = req.session.userId
      ? {
          id: req.session.userId,
          nombre: req.session.nombre,
          rol: req.session.rol
        }
      : null;

    res.status(500).render('home', {
      publicaciones: [],
      currentUser,
      error: 'Error al cargar publicaciones'
    });
  }
}

module.exports = {
  inicio
};