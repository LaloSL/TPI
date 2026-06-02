const { Model, DataTypes } = require('sequelize');
const sequelize = require('./db');
const Usuario = require('./Usuario');

class Notificacion extends Model {}

Notificacion.init(
  {
    mensaje: {
      type: DataTypes.STRING,
      allowNull: false
    },

    leida: {
      type: DataTypes.BOOLEAN,
      defaultValue: false
    }
  },
  {
    sequelize,
    modelName: 'Notificacion',
    tableName: 'notificaciones'
  }
);

// Usuario que recibe la notificación
Usuario.hasMany(Notificacion, {
  foreignKey: 'usuarioId'
});

Notificacion.belongsTo(Usuario, {
  foreignKey: 'usuarioId'
});

module.exports = Notificacion;

/* CREATE TABLE notificaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,

    mensaje VARCHAR(255) NOT NULL,

    leida BOOLEAN NOT NULL DEFAULT FALSE,

    usuarioId INT,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_notificaciones_usuario
        FOREIGN KEY (usuarioId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); */