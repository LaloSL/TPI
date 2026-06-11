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
      allowNull: false,
      validate: {
        notEmpty: {
          msg: 'El nombre es obligatorio'
        },
        len: {
          args: [3, 100],
          msg: 'El nombre debe tener entre 3 y 100 caracteres'
        }
      }
    },

    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
      validate: {
        notEmpty: {
          msg: 'El correo electrónico es obligatorio'
        },
        isEmail: {
          msg: 'El correo electrónico no es válido'
        }
      }
    },

    dni: {
      type: DataTypes.INTEGER,
      allowNull: false,
      unique: true,
      validate: {
        notEmpty: {
          msg: 'El DNI es obligatorio'
        },
        isInt: {
          msg: 'El DNI solo debe contener números'
        },
        min: {
          args: [1],
          msg: 'El DNI debe ser mayor a 0'
        }
      }
    },

    password: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: {
          msg: 'La contraseña es obligatoria'
        },
        len: {
          args: [6, 255],
          msg: 'La contraseña debe tener al menos 6 caracteres'
        }
      }
    },

    rol: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: 'usuario'
    },

    estado: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: 'activo'
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