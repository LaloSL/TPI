const { Model, DataTypes } = require('sequelize');
const sequelize = require('./db');
const Usuario = require('./Usuario');

class Seguidor extends Model {}

Seguidor.init(
  {},
  {
    sequelize,
    modelName: 'Seguidor',
    tableName: 'seguidores'
  }
);

Usuario.belongsToMany(Usuario, {
  through: Seguidor,
  as: 'Seguidos',
  foreignKey: 'seguidorId',
  otherKey: 'seguidoId'
});

Usuario.belongsToMany(Usuario, {
  through: Seguidor,
  as: 'Seguidores',
  foreignKey: 'seguidoId',
  otherKey: 'seguidorId'
});

module.exports = Seguidor;

/* CREATE TABLE seguidores (
    seguidorId INT NOT NULL,
    seguidoId INT NOT NULL,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (seguidorId, seguidoId),

    CONSTRAINT fk_seguidores_seguidor
        FOREIGN KEY (seguidorId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_seguidores_seguido
        FOREIGN KEY (seguidoId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); */