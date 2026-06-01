const { Model, DataTypes } = require('sequelize');

const sequelize = require('./db');

class Etiqueta extends Model {}

Etiqueta.init(
  {
    nombre: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    }
  },
  {
    sequelize,
    modelName: 'Etiqueta',
    tableName: 'etiquetas'
  }
);

module.exports = Etiqueta;

/*CREATE TABLE etiquetas (
    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(255) NOT NULL UNIQUE,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
); */