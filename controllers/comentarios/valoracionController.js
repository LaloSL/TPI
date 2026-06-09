const Valoracion = require('../../models/Valoracion');
const Archivo = require('../../models/Archivo');
const Publicacion = require('../../models/Publicacion');

async function guardar(req, res) {

  try {

    const { archivoId } = req.params;
    const { valor } = req.body;

    const usuarioId = req.session.userId;


    if (!usuarioId) {

      return res.status(401).send('Debes iniciar sesión');
    }


    const archivo = await Archivo.findByPk(archivoId, {

      include: [
        {
          model: Publicacion
        }
      ]

    });

    if (!archivo) {

      return res.status(404).send('Archivo no encontrado');
    }

   //no valora si es el dueño
    if (
      archivo.Publicacion &&
      archivo.Publicacion.usuarioId === usuarioId
    ) {

      return res.status(403).send(
        'No podés valorar tu propia publicación'
      );
    }


    if (valor < 1 || valor > 5) {

      return res.status(400).send('Valor inválido');
    }


    const valoracionExistente = await Valoracion.findOne({

      where: {
        usuarioId: usuarioId,
        archivoId: archivoId
      }

    });


    if (valoracionExistente) {

      req.session.errorValoracion =
        'Ya valoraste esta imagen. No podés volver a valorarla.';

      return res.redirect('/');

    } else {


      await Valoracion.create({

        valor: valor,
        usuarioId: usuarioId,
        archivoId: archivoId

      });

      console.log('Valoración creada');
    }

    res.redirect('/');

  } catch (error) {

    console.error('Error al guardar valoración:', error);

    res.status(500).send('Error interno del servidor');
  }
}

module.exports = {
  guardar
};