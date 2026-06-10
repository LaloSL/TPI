const multer = require('multer');

const storage = multer.memoryStorage();

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