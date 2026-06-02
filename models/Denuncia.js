const { Model, DataTypes } = require('sequelize');

const sequelize = require('./db');

const Usuario = require('./Usuario');
const Publicacion = require('./Publicacion');

class Denuncia extends Model {}

Denuncia.init(
  {
    motivo: {
      type: DataTypes.STRING,
      allowNull: false
    },

    descripcion: {
      type: DataTypes.TEXT,
      allowNull: false
    },

    estado: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: 'pendiente'
    }
  },
  {
    sequelize,
    modelName: 'Denuncia',
    tableName: 'denuncias'
  }
);


// Un usuario puede hacer muchas denuncias
Usuario.hasMany(Denuncia, {
  foreignKey: 'usuarioId'
});
// Una denuncia pertenece a un usuario
Denuncia.belongsTo(Usuario, {
  foreignKey: 'usuarioId'
});


// Una publicación puede tener muchas denuncias
Publicacion.hasMany(Denuncia, {
  foreignKey: 'publicacionId'
});
// Una denuncia pertenece a una publicación
Denuncia.belongsTo(Publicacion, {
  foreignKey: 'publicacionId'
});

module.exports = Denuncia;

/*CREATE TABLE denuncias (
    id INT AUTO_INCREMENT PRIMARY KEY,

    motivo VARCHAR(255) NOT NULL,

    descripcion TEXT NOT NULL,

    estado VARCHAR(50) NOT NULL DEFAULT 'pendiente',

    usuarioId INT,

    publicacionId INT,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_denuncias_usuario
        FOREIGN KEY (usuarioId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_denuncias_publicacion
        FOREIGN KEY (publicacionId)
        REFERENCES publicaciones(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); */