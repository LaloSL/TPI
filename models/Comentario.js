const { Model, DataTypes } = require('sequelize');
const sequelize = require('./db');
const Usuario = require('./Usuario');
const Publicacion = require('./Publicacion');   


class Comentario extends Model {}

Comentario.init({
  contenido: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  fecha: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  estadoComentario: {
  type: DataTypes.STRING,
  allowNull: false,
  defaultValue: 'activo'
}
}, {
  sequelize,
  modelName: 'Comentario',
  tableName: 'comentarios'
});


// Un comentario pertenece a un usuario
Usuario.hasMany(Comentario, { foreignKey: 'usuarioId' });
Comentario.belongsTo(Usuario, { foreignKey: 'usuarioId' });
// Un comentario pertenece a una publicación
Publicacion.hasMany(Comentario, { foreignKey: 'publicacionId' });
Comentario.belongsTo(Publicacion, { foreignKey: 'publicacionId' });

module.exports = Comentario;


/* CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,

    contenido TEXT NOT NULL,

    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,

    estadoComentario VARCHAR(50) NOT NULL DEFAULT 'activo',

    usuarioId INT,

    publicacionId INT,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_comentarios_usuario
        FOREIGN KEY (usuarioId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_comentarios_publicacion
        FOREIGN KEY (publicacionId)
        REFERENCES publicaciones(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);*/