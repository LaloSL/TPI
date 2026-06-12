FOTAZA 2
Programación Web II – Trabajo Práctico Integrador
Autor: Guillermo Concha
Tecnologías utilizadas
•	Node.js
•	Express
•	Sequelize

•	PostgreSQL
•	Neon

•	Pug
•	CSS

•	Multer
•	Sharp
•	Cloudinary

•	Express Session
•	Bcrypt

•	Git
•	GitHub

•	DBeaver
•	Visual Studio Code
________________________________________
Instalación
Clonar el repositorio:
git clone https://github.com/LaloSL/TPI.git
Instalar dependencias:
npm install express sequelize pg pg-hstore multer express-session pug bcrypt dotenv sharp cloudinary multer-storage-cloudinary
Configurar variables de entorno:
Tomar como referencia el archivo .env.example
Variables utilizadas:
DB_NAME
DB_USER
DB_PASSWORD
DB_HOST
DB_PORT
DB_SSL
PORT
SESSION_SECRET
CLOUDINARY_CLOUD_NAME
CLOUDINARY_API_KEY
CLOUDINARY_API_SECRET
Ejecutar la aplicación:
npm start
La aplicación quedará disponible en:
http://localhost:3000
________________________________________
Funcionalidades
Usuarios
• Registro de usuarios.
• Inicio de sesión.
• Cierre de sesión.
• Gestión de perfiles.
• Cambio de contraseña.
Publicaciones
• Crear publicaciones.
• Adjuntar imágenes.
• Uso de etiquetas.
• Visualización de publicaciones.
Comentarios
• Agregar comentarios.
• Habilitar comentarios.
• Deshabilitar comentarios.

Valoraciones
• Valorar imágenes de 1 a 5.
• Visualización del promedio de valoración.
• Visualización de la cantidad de valoraciones.
Seguidores
• Seguir usuarios.
• Dejar de seguir usuarios.
Notificaciones
• Nuevos seguidores.
• Comentarios.
• Valoraciones.
• Interés en publicaciones.
Moderación
• Denuncias de publicaciones.
• Denuncias de comentarios.
Colecciones
• Crear colecciones.
• Guardar publicaciones favoritas.
Administración
• Listado completo de usuarios.
• Visualización del estado de los usuarios (activo/inactivo).
• Asignación de rol administrador.
• Revocación de rol administrador.
• Moderación de publicaciones denunciadas.
• Moderación de comentarios denunciados.
________________________________________
Usuarios de prueba
Administrador
DNI: 555
Contraseña: 123456
Permisos:
• Todas las funcionalidades de un usuario común.
• Administración de usuarios.
• Asignación de rol administrador.
• Revocación de rol administrador.
• Moderación de publicaciones denunciadas.
• Moderación de comentarios denunciados.
Usuario común
DNI: 777
Contraseña: 123456
Permisos:
• Crear publicaciones.
• Comentar publicaciones.
• Valorar imágenes.
• Seguir usuarios.
• Crear colecciones.
• Denunciar contenido.
• Modificar contraseña.
• Gestionar perfil.
________________________________________
URL de producción: 
https://fotaza-tau.vercel.app
________________________________________
Estructura general
• config/ (configuración de servicios externos)
• controllers/ (controladores de la aplicación)
• middleware/ (middlewares de autenticación y validación)
• models/ (modelos Sequelize)
• public/ (archivos estáticos y CSS)
• routes/ (rutas de la aplicación)
• views/ (vistas Pug)
Archivos principales
• app.js
• package.json
• .env.example
________________________________________
Base de datos
La aplicación utiliza PostgreSQL como sistema gestor de bases de datos y Sequelize como ORM.
La estructura completa de la base de datos y los datos de prueba pueden restaurarse utilizando el archivo:
backup.sql

