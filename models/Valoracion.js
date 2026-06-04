const { Model, DataTypes } = require('sequelize');
const sequelize = require('./db');

const Usuario = require('./Usuario');
const Archivo = require('./Archivo');

class Valoracion extends Model {}

Valoracion.init(
  {
    valor: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        min: 1,
        max: 5
      }
    }
  },
  {
    sequelize,
    modelName: 'Valoracion',
    tableName: 'valoraciones',
    indexes: [
      {
        //  un usuario solo valora un archivo una vez
        unique: true,
        fields: ['usuarioId', 'archivoId']
      }
    ]
  }
);

Usuario.hasMany(Valoracion, {
  foreignKey: 'usuarioId'
});

Valoracion.belongsTo(Usuario, {
  foreignKey: 'usuarioId'
});

Archivo.hasMany(Valoracion, {
  foreignKey: 'archivoId'
});

Valoracion.belongsTo(Archivo, {
  foreignKey: 'archivoId'
});

module.exports = Valoracion;

/*datos para workbrench
    CREATE TABLE valoraciones (
    id INT AUTO_INCREMENT PRIMARY KEY,

    valor INT NOT NULL,

    usuarioId INT NOT NULL,
    archivoId INT NOT NULL,

    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT chk_valor
        CHECK (valor BETWEEN 1 AND 5),

    CONSTRAINT fk_valoracion_usuario
        FOREIGN KEY (usuarioId)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_valoracion_archivo
        FOREIGN KEY (archivoId)
        REFERENCES archivos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT unique_valoracion
        UNIQUE (usuarioId, archivoId)
);*/
