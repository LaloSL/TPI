const { Model, DataTypes } = require('sequelize');
const bcrypt = require('bcrypt');
const sequelize = require('./db');

class Usuario extends Model {
  async validarPassword(password) {
    return await bcrypt.compare(password, this.password);
  }
}

Usuario.init(
  {
    nombre: {
      type: DataTypes.STRING,
      allowNull: false
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    },
    dni: {
      type: DataTypes.INTEGER,
      allowNull: false,
      unique: true
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false
    },
    rol: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: 'usuario'
    },
    fecha_registro: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    }
  },
  {
    sequelize,
    modelName: 'Usuario',
    tableName: 'usuarios'
  }
);

module.exports = Usuario;

/*
CREATE DATABASE fotaza_db;

USE fotaza_db;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    nombre VARCHAR(255) NOT NULL,
    
    email VARCHAR(255) NOT NULL UNIQUE,
    
    dni INT NOT NULL UNIQUE,
    
    password VARCHAR(255) NOT NULL,
    
    rol VARCHAR(255) NOT NULL DEFAULT 'usuario',
    
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);  
*/