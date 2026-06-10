/*require('dotenv').config();

const { Sequelize } = require('sequelize');
const pg = require('pg');

const sslConn = process.env.DB_SSL === 'true'
  ? {
      ssl: {
        require: true,
        rejectUnauthorized: false
      }
    }
  : undefined;

const sequelize = new Sequelize({
  dialect: 'postgres',
  dialectModule: pg,
  dialectOptions: sslConn,
  host: process.env.DB_HOST,
  username: process.env.DB_USER,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
  logging: false
});

module.exports = sequelize;*/
require('dotenv').config();

const { Sequelize } = require('sequelize');
const pg = require('pg');

const databaseUrl =
  process.env.POSTGRES_URL ||
  process.env.DATABASE_URL;

const sequelize = databaseUrl
  ? new Sequelize(databaseUrl, {
      dialect: 'postgres',
      dialectModule: pg,
      logging: false,
      dialectOptions: {
        ssl: {
          require: true,
          rejectUnauthorized: false
        }
      }
    })
  : new Sequelize({
      dialect: 'postgres',
      dialectModule: pg,
      host: process.env.DB_HOST,
      username: process.env.DB_USER,
      database: process.env.DB_NAME,
      password: process.env.DB_PASSWORD,
      port: process.env.DB_PORT,
      logging: false
    });

module.exports = sequelize;