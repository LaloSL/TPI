const { Model, DataTypes } = require('sequelize');

const sequelize = require('./db');

const Usuario = require('./Usuario');
const Publicacion = require('./Publicacion');

class Archivo extends Model {}

Archivo.init(
  {

    ruta: {
      type: DataTypes.STRING(1000),
      allowNull: false
    },


    tipo: {
      type: DataTypes.STRING(100),
      allowNull: false
    },

    size: {
      type: DataTypes.INTEGER,
      allowNull: false
    },


    fecha: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    },

    tieneCopyright: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: false
    },


    rutaProtegida: {
      type: DataTypes.STRING(1000),
      allowNull: true
    }

  },
  {
    sequelize,
    modelName: 'Archivo',
    tableName: 'archivos'
  }
);


// Un usuario puede tener muchos archivos
Usuario.hasMany(Archivo, {
  foreignKey: 'usuarioId'
});

// Un archivo pertenece a un usuario
Archivo.belongsTo(Usuario, {
  foreignKey: 'usuarioId'
});

// Una publicación puede tener muchos archivos
Publicacion.hasMany(Archivo, {
  foreignKey: 'publicacionId'
});

// Un archivo pertenece a una publicación
Archivo.belongsTo(Publicacion, {
  foreignKey: 'publicacionId'
});

module.exports = Archivo;

/* CREATE TABLE archivos (
    id INT AUTO_INCREMENT PRIMARY KEY,

    ruta VARCHAR(255) NOT NULL,

    tipo VARCHAR(100) NOT NULL,

    size INT NOT NULL,

    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,

    tieneCopyright BOOLEAN NOT NULL DEFAULT FALSE,

    rutaProtegida VARCHAR(255),

    usuarioId INT,

    publicacionId INT,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_archivos_usuario
        FOREIGN KEY (usuarioId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_archivos_publicacion
        FOREIGN KEY (publicacionId)
        REFERENCES publicaciones(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);*/