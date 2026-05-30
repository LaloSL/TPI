require('dotenv').config();

const express = require('express');
const path = require('path');
const session = require('express-session');

const app = express();


// CONFIGURACIÓN

const PORT = process.env.PORT || 3000;


// PUG


app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));


// MIDDLEWARES

app.use(express.json());

app.use(express.urlencoded({
  extended: true
}));

app.use(express.static(
  path.join(__dirname, 'public')
));

app.use(
  session({
    secret:
      process.env.SESSION_SECRET ||
      'fotaza-secret',

    resave: false,

    saveUninitialized: false,

    cookie: {
      secure: false,
      maxAge: 24 * 60 * 60 * 1000
    }
  })
);


// RUTA PRINCIPAL

app.get('/', (req, res) => {

  res.send(
    'Fotaza 2 funcionando correctamente'
  );

});



// INICIO SERVIDOR

app.listen(PORT, () => {

  console.log(
    `Servidor iniciado en http://localhost:${PORT}`
  );

});


//Dependecias
// npm install express sequelize mysql2 multer express-session pug bcrypt dotenv sharp