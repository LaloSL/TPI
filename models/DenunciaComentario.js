const { Model, DataTypes } = require('sequelize');

const sequelize = require('./db');

const Usuario = require('./Usuario');
const Comentario = require('./Comentario');

class DenunciaComentario extends Model {}

DenunciaComentario.init(
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
    modelName: 'DenunciaComentario',
    tableName: 'denuncias_comentarios'
  }
);


Usuario.hasMany(DenunciaComentario, {
  foreignKey: 'usuarioId'
});

DenunciaComentario.belongsTo(Usuario, {
  foreignKey: 'usuarioId'
});


Comentario.hasMany(DenunciaComentario, {
  foreignKey: 'comentarioId'
});

DenunciaComentario.belongsTo(Comentario, {
  foreignKey: 'comentarioId'
});

module.exports = DenunciaComentario;

/* CREATE TABLE denuncias_comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,

    motivo VARCHAR(255) NOT NULL,

    descripcion TEXT NOT NULL,

    estado VARCHAR(50) NOT NULL DEFAULT 'pendiente',

    usuarioId INT,

    comentarioId INT,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_denunciascomentarios_usuario
        FOREIGN KEY (usuarioId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_denunciascomentarios_comentario
        FOREIGN KEY (comentarioId)
        REFERENCES comentarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); */