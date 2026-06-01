const Etiqueta = require('../models/Etiqueta');
const Publicacion = require('../models/Publicacion');
const PublicacionEtiqueta = require('../models/PublicacionEtiqueta');

async function guardar(req, res) {

  try {

    const { publicacionId } = req.params;

    const { etiqueta } = req.body;

    const publicacion = await Publicacion.findByPk(publicacionId);

    if (!publicacion) {

      return res.status(404).send('Publicación no encontrada');
    }


    if (!etiqueta || etiqueta.trim() === '') {

      return res.status(400).send('La etiqueta es obligatoria');
    }

    const [nuevaEtiqueta] = await Etiqueta.findOrCreate({

      where: {
        nombre: etiqueta.trim().toLowerCase()
      }

    });

    await PublicacionEtiqueta.findOrCreate({

      where: {
        publicacionId: publicacion.id,
        etiquetaId: nuevaEtiqueta.id
      }

    });

    console.log('Etiqueta asociada correctamente');

    res.redirect('/');

  } catch (error) {

    console.error('Error al guardar etiqueta:', error);

    res.status(500).send('Error interno del servidor');
  }
}

module.exports = {
  guardar
};