const { Model, DataTypes } = require('sequelize');
const sequelize = require('./db');
const Usuario = require('./Usuario');

class Mensaje extends Model {}

Mensaje.init(
  {
    contenido: {
      type: DataTypes.TEXT,
      allowNull: false
    }
  },
  {
    sequelize,
    modelName: 'Mensaje',
    tableName: 'mensajes'
  }
);

//un usuario puede enviar muchos mensajes
Mensaje.belongsTo(Usuario, {
  foreignKey: 'emisorId',
  as: 'emisor'
});
  
//un usuario puede recibir muchos mensajes
Mensaje.belongsTo(Usuario, {
  foreignKey: 'receptorId',
  as: 'receptor'
});

module.exports = Mensaje;
