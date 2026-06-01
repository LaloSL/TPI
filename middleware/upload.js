const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({

  destination: function (req, file, cb) {

    cb(null, 'public/uploads'); 
  },


  filename: function (req, file, cb) {
    const extension = path.extname(file.originalname);
    const nombreUnico =
      Date.now() + '-' + Math.round(Math.random() * 1E9) + extension;
    cb(null, nombreUnico);
  }
});


// tipos de archivos permitidos
const fileFilter = function (req, file, cb) {
  const tiposPermitidos = [
    'image/jpeg',
    'image/png',
    'image/jpg',
    'video/mp4',
    'video/webm',
    'video/quicktime'
  ];

  if (tiposPermitidos.includes(file.mimetype)) {
    cb(null, true);
  } else {
    cb(new Error('Solo se permiten imágenes o videos'), false);
  }
};


const upload = multer({
  storage,
  fileFilter
});


module.exports = upload;