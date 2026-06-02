const { Model, DataTypes } = require('sequelize');
const sequelize = require('./db');

const Usuario = require('./Usuario');
const Publicacion = require('./Publicacion');

class Like extends Model {}

Like.init(
  {
    usuarioId: {
      type: DataTypes.INTEGER,
      allowNull: false
    },

    publicacionId: {
      type: DataTypes.INTEGER,
      allowNull: false
    },

    fecha: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    }
  },
  {
    sequelize,
    modelName: 'Like',    
    tableName: 'likes'    
  }
);


// Un usuario puede dar muchos likes
Usuario.hasMany(Like, { foreignKey: 'usuarioId' });
Like.belongsTo(Usuario, { foreignKey: 'usuarioId' });

// Una publicación puede tener muchos likes
Publicacion.hasMany(Like, { foreignKey: 'publicacionId' });
Like.belongsTo(Publicacion, { foreignKey: 'publicacionId' });

module.exports = Like;

/* CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,

    usuarioId INT NOT NULL,

    publicacionId INT NOT NULL,

    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_likes_usuario
        FOREIGN KEY (usuarioId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_likes_publicacion
        FOREIGN KEY (publicacionId)
        REFERENCES publicaciones(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); */