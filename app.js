

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
//app.use(getCurrentUser);


const PORT = process.env.PORT || 3000;


// Rutas principales
const indexRoutes = require('./routes/principal/index');
const usuariosRoutes = require('./routes/principal/usuarios');
const administradorRoutes = require('./routes/principal/admin');
const seguidoresRoutes = require('./routes/principal/seguidores');

//publicaciones
const subirRoutes = require('./routes/publicacion/subirRoutes'); 
const publicacionesRoutes = require('./routes/publicacion/publicacionesRoutes');
const etiquetasRoutes = require('./routes/publicacion/etiquetasRoutes');
const publicarEtiquetasRoutes = require('./routes/publicacion/publicarEtiquetas');

//interacciones del sistema
const likesRoutes = require('./routes/comentarios/like');
const comentariosRoutes = require('./routes/comentarios/comentarios');
const valoracionesRoutes = require('./routes/comentarios/valoracion');
const denunciasRoutes = require('./routes/comentarios/denuncias');
const denunciasComentariosRoutes = require('./routes/comentarios/denunciasComentarios');
const notificacionesRoutes = require('./routes/comentarios/notificaciones');
const moderacionRoutes = require('./routes/publicacion/moderacion');

//mensajes
const mensajesRoutes = require('./routes/mensajes/mensajes');

//colecciones
const coleccionesRoutes = require('./routes/colecciones/colecciones');


// Configuración de Pug

app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));


// Configuración de sesión

app.use(
  session({
    secret: process.env.SESSION_SECRET || 'clave_secreta_fotos',
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: false,
      maxAge: 24 * 60 * 60 * 1000
    }
  })
);

app.use(getCurrentUser);


// Montaje de rutas
app.use('/', indexRoutes);
app.use('/usuarios', usuariosRoutes);
app.use('/administrador', administradorRoutes);
app.use('/seguidores', seguidoresRoutes);

//publicaciones
app.use('/subir', subirRoutes);
app.use('/publicaciones', publicacionesRoutes);
app.use('/etiquetas', etiquetasRoutes);
app.use('/publicarEtiquetas', publicarEtiquetasRoutes);
app.use('/moderacion', moderacionRoutes);
app.use('/colecciones', coleccionesRoutes);
app.use('/mensajes', mensajesRoutes);

//interacciones del sistema
app.use('/likes', likesRoutes);
app.use('/comentarios', comentariosRoutes);
app.use('/valoraciones', valoracionesRoutes);
app.use('/denuncias', denunciasRoutes);
app.use('/denuncias-comentarios', denunciasComentariosRoutes);
app.use('/notificaciones', notificacionesRoutes);

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


  //Dependecias
// npm install express sequelize mysql2 multer express-session pug bcrypt dotenv sharp