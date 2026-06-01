//Dependecias
// npm install express sequelize mysql2 multer express-session pug bcrypt dotenv sharp

require('dotenv').config();

const express = require('express');
const path = require('path');
const session = require('express-session');

const app = express();

const sequelize = require('./models/db');


// Middleware
const { getCurrentUser } = require('./middleware/auth');
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(getCurrentUser);


const PORT = process.env.PORT || 3000;


// Rutas - eje principal

const indexRoutes = require('./routes/eje/index');
const usuariosRoutes = require('./routes/eje/usuarios');
const administradorRoutes = require('./routes/eje/admin');

// Rutas - publicaciones

const subirRoutes = require('./routes/publicaciones/subirRoutes');
const publicacionesRoutes = require('./routes/publicaciones/publicacionesRoutes');
const etiquetasRoutes = require('./routes/publicaciones/etiquetas');
const publicarEtiquetasRoutes = require('./routes/publicaciones/publicarEtiquetas');


// Configuración de Pug

app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));


// Configuración de sesión

app.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: false,
      maxAge: 24 * 60 * 60 * 1000
    }
  })
);


// Montaje de rutas

app.use('/', indexRoutes);
app.use('/usuarios', usuariosRoutes);
app.use('/administrador', administradorRoutes);

// Montaje rutas - publicaciones

app.use('/subir', subirRoutes);
app.use('/publicaciones', publicacionesRoutes);
app.use('/etiquetas', etiquetasRoutes);
app.use('/publicarEtiquetas', publicarEtiquetasRoutes);


sequelize
  .sync()
  .then(() => {
    console.log('Modelos sincronizados correctamente');

    app.listen(PORT, () => {
      console.log(`Servidor iniciado en http://localhost:${PORT}`);
    });
  })
  .catch((err) => {
    console.error('Error al sincronizar modelos:', err);
  });
