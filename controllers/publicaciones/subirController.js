const sharp = require('sharp');
const cloudinary = require('../../config/cloudinary');

const Publicacion = require('../../models/Publicacion');
const Archivo = require('../../models/Archivo');
const Etiqueta = require('../../models/Etiqueta');
const PublicacionEtiqueta = require('../../models/PublicacionEtiqueta');

function subirACloudinary(buffer, mimetype, carpeta) {
  return new Promise((resolve, reject) => {
    const tipoRecurso = mimetype.startsWith('video/') ? 'video' : 'image';

    const stream = cloudinary.uploader.upload_stream(
      {
        folder: carpeta,
        resource_type: tipoRecurso
      },
      (error, resultado) => {
        if (error) {
          reject(error);
        } else {
          resolve(resultado);
        }
      }
    );

    stream.end(buffer);
  });
}

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
      let bufferFinal = archivo.buffer;
      let rutaProtegida = null;

      if (
        copyrightActivo &&
        archivo.mimetype.startsWith('image/')
      ) {
        const rutaMarcaAgua = 'public/MarcaDeAgua/marcaDeAgua.png';

        const metadata =
          await sharp(archivo.buffer).metadata();

        const anchoMarcaAgua =
          Math.round(metadata.width * 0.45);

        const marcaAguaBuffer =
          await sharp(rutaMarcaAgua)
            .resize({
              width: anchoMarcaAgua
            })
            .toBuffer();

        bufferFinal =
          await sharp(archivo.buffer)
            .composite([
              {
                input: marcaAguaBuffer,
                gravity: 'center'
              }
            ])
            .toBuffer();
      }

      const resultadoCloudinary =
        await subirACloudinary(
          bufferFinal,
          archivo.mimetype,
          'fotaza'
        );

      const urlArchivo =
        resultadoCloudinary.secure_url || resultadoCloudinary.url;

      if (!urlArchivo) {
        throw new Error('Cloudinary no devolvió URL del archivo');
      }

      if (
        copyrightActivo &&
        archivo.mimetype.startsWith('image/')
      ) {
        rutaProtegida = urlArchivo;
      }

      await Archivo.create({
        usuarioId: userId,
        ruta: urlArchivo,
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

    res.status(500).render('publicaciones/subir', {
      title: 'Subir publicación',
      error: 'Error al guardar la publicación'
    });
  }
}

module.exports = {
  formulario,
  guardar
};