const path = require('path');
//librería para agregar marca de agua 
const sharp = require('sharp');

const Publicacion = require('../../models/Publicacion');
const Archivo = require('../../models/Archivo');
const Etiqueta = require('../../models/Etiqueta');
const PublicacionEtiqueta = require('../../models/PublicacionEtiqueta');


async function formulario(req, res) {
  try {
    res.render('publicaciones/subir', {
      title: 'Subir publicación'
    });

  } catch (error) {
    console.error('Error al cargar formulario:', error);

    res.status(500).render('publicaciones/subir', {
      title: 'Subir publicación',
      error: 'Error al cargar el formulario'
    });
  }
}


// ==================================================================================================================

async function guardar(req, res) {
  try {

    const {
      descripcion,
      etiqueta,
      tieneCopyright
    } = req.body;

    const copyrightActivo =
      parseInt(tieneCopyright) === 1;

    if (!descripcion) {

      return res.status(400).render('publicaciones/subir', {
        title: 'Subir publicación',
        error: 'La descripción es obligatoria'
      });
    }

    if (!etiqueta || etiqueta.trim() === '') {

      return res.status(400).render('publicaciones/subir', {
        title: 'Subir publicación',
        error: 'La etiqueta es obligatoria'
      });
    }

    if (!req.files || req.files.length === 0) {

      return res.status(400).render('publicaciones/subir', {
        title: 'Subir publicación',
        error: 'Debes subir al menos una imagen o video'
      });
    }

    if (!req.session.userId) {

      return res.status(401).render('publicaciones/subir', {
        title: 'Subir publicación',
        error: 'Debes iniciar sesión'
      });
    }

    const userId = req.session.userId;

    const publicacion = await Publicacion.create({

      usuarioId: userId,
      descripcion,
      ubicacion: '',
      fecha: new Date()

    });

    for (const archivo of req.files) {

      let rutaProtegida = null;

      //es imagen y protegida?
      if (
        copyrightActivo &&
        archivo.mimetype.startsWith('image/')
      ) {

        const rutaOriginalFisica = archivo.path;

        const nombreProtegido =
          `protegida-${archivo.filename}`;

        const rutaProtegidaFisica = path.join(
          'public',
          'uploads',
          nombreProtegido
        );

        const rutaMarcaAgua = path.join(
          __dirname,
          '../public/MarcaDeAgua/marcaDeAgua.png'
        );

        const metadata =
          await sharp(rutaOriginalFisica).metadata();

        //modifica tañamo marca de agua
        const anchoMarcaAgua =
          Math.round(metadata.width * 0.45);

        const marcaAguaBuffer =
          await sharp(rutaMarcaAgua)
            .resize({
              width: anchoMarcaAgua
            })
            .toBuffer();

        await sharp(rutaOriginalFisica)
          .composite([
            {
              input: marcaAguaBuffer,
              gravity: 'center'
            }
          ])
          .toFile(rutaProtegidaFisica);

        rutaProtegida = nombreProtegido;
      }

      await Archivo.create({

        usuarioId: userId,
        ruta: archivo.filename,
        tipo: archivo.mimetype,
        size: archivo.size,
        publicacionId: publicacion.id,
        fecha: new Date(),

        tieneCopyright: copyrightActivo,

        rutaProtegida

      });
    }

    const [etiquetaCreada] =
      await Etiqueta.findOrCreate({

        where: {
          nombre: etiqueta.trim().toLowerCase()
        }

      });


    await PublicacionEtiqueta.findOrCreate({

      where: {
        publicacionId: publicacion.id,
        etiquetaId: etiquetaCreada.id
      }

    });
    res.redirect('/');

  } catch (error) {

    console.error(
      'ERROR REAL AL GUARDAR PUBLICACIÓN:',
      error
    );

    res.status(500).render('subir', {
      title: 'Subir publicación',
      error: 'Error al guardar la publicación'
    });
  }
}


module.exports = {
  formulario,
  guardar
};