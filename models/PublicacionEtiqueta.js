const { Model, DataTypes } = require('sequelize');

const sequelize = require('./db');

const Publicacion = require('./Publicacion');
const Etiqueta = require('./Etiqueta');

class PublicacionEtiqueta extends Model {}

PublicacionEtiqueta.init(
  {},
  {
    sequelize,
    modelName: 'PublicacionEtiqueta',
    tableName: 'publicacionetiqueta'
  }
);

// Una publicación puede tener muchas etiquetas
Publicacion.belongsToMany(Etiqueta, {
  through: PublicacionEtiqueta,
  foreignKey: 'publicacionId'
});

// Una etiqueta puede estar en muchas publicaciones
Etiqueta.belongsToMany(Publicacion, {
  through: PublicacionEtiqueta,
  foreignKey: 'etiquetaId'
});

module.exports = PublicacionEtiqueta;

/* CREATE TABLE publicacionetiqueta (
    publicacionId INT NOT NULL,
    etiquetaId INT NOT NULL,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (publicacionId, etiquetaId),

    CONSTRAINT fk_publicacionetiqueta_publicacion
        FOREIGN KEY (publicacionId)
        REFERENCES publicaciones(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_publicacionetiqueta_etiqueta
        FOREIGN KEY (etiquetaId)
        REFERENCES etiquetas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);*/