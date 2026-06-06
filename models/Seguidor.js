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