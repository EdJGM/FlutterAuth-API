# FlutterAuth API 

## Descripción del Proyecto

Este proyecto es una aplicación móvil desarrollada como parte del primer parcial de Desarrollo de Aplicaciones Móviles. La aplicación cuenta con un frontend desarrollado en Flutter y un backend en PHP con autenticación JWT.

## Estructura del Proyecto

```
├── front/                  # Aplicación Flutter (Frontend)
│   ├── lib/               # Código fuente de Flutter
│   │   ├── main.dart      # Punto de entrada de la aplicación
│   │   ├── pages/         # Páginas/Pantallas de la aplicación
│   │   └── services/      # Servicios (API calls, etc.)
│   ├── android/           # Configuración específica de Android
│   ├── ios/              # Configuración específica de iOS
│   └── pubspec.yaml      # Dependencias de Flutter
├── BACKEND/              # Servidor PHP (Backend)
│   ├── src/              # Código fuente del backend
│   │   ├── auth.php      # Autenticación
│   │   ├── config.php    # Configuración
│   │   ├── crud.php      # Operaciones CRUD
│   │   ├── jwt_helper.php # Helper para JWT
│   │   └── User.php      # Modelo de Usuario
│   ├── vendor/           # Dependencias de Composer
│   └── composer.json     # Dependencias de PHP
└── app_users.sql         # Script de base de datos
```

## Tecnologías Utilizadas

### Frontend (Flutter)
- **Flutter SDK**: ^3.5.4
- **Dart**: Compatible con SDK ^3.5.4
- **Dependencias principales**:
  - `http: ^1.2.2` - Para peticiones HTTP al backend
  - `cupertino_icons: ^1.0.8` - Iconos iOS

### Backend (PHP)
- **PHP**: Compatible con Composer
- **Dependencias principales**:
  - `firebase/php-jwt: ^6.10` - Para manejo de tokens JWT
- **Base de datos**: SQL (ver `app_users.sql`)

## Instalación y Configuración

### Prerrequisitos
- Flutter SDK (versión 3.5.4 o superior)
- Dart SDK
- PHP (versión 7.4 o superior)
- Composer
- Servidor web (Apache/Nginx)
- Base de datos MySQL/PostgreSQL

### Configuración del Backend

1. **Instalar dependencias de PHP**:
   ```bash
   cd BACKEND
   composer install
   ```

2. **Configurar la base de datos**:
   - Importar el archivo `app_users.sql` en tu base de datos
   - Configurar las credenciales de conexión en `src/config.php`

3. **Configurar el servidor web**:
   - Apuntar el document root a la carpeta `BACKEND`
   - Asegurar que PHP esté habilitado

### Configuración del Frontend

1. **Instalar Flutter** (si no está instalado):
   - Seguir las instrucciones en [flutter.dev](https://flutter.dev/docs/get-started/install)

2. **Instalar dependencias**:
   ```bash
   cd front
   flutter pub get
   ```

3. **Ejecutar la aplicación**:
   ```bash
   flutter run
   ```

## Uso

### Desarrollo
- **Backend**: El servidor PHP debe estar ejecutándose para que la aplicación funcione correctamente
- **Frontend**: Usar `flutter run` para ejecutar en modo desarrollo
- **Hot Reload**: Flutter soporta hot reload para desarrollo rápido

### Testing
```bash
cd front
flutter test
```

## Características Principales

- **Autenticación JWT**: Sistema seguro de autenticación
- **CRUD de Usuarios**: Operaciones completas de gestión de usuarios
- **Interfaz Móvil**: Diseño responsivo para dispositivos móviles
- **API RESTful**: Backend bien estructurado con endpoints REST

## Estructura de la API

El backend proporciona los siguientes endpoints:

- `POST /auth.php` - Autenticación de usuarios
- `GET/POST/PUT/DELETE /crud.php` - Operaciones CRUD de usuarios

## Equipo de Desarrollo

- **Desarrollador**: AvilesDanie
- **Email**: daaviles3@espe.edu.ec
- **Institución**: ESPE (Escuela Politécnica del Ejército)

## Contribución

1. Fork el proyecto
2. Crear una rama para la nueva característica (`git checkout -b feature/nueva-caracteristica`)
3. Commit los cambios (`git commit -am 'Añadir nueva característica'`)
4. Push a la rama (`git push origin feature/nueva-caracteristica`)
5. Crear un Pull Request

## Licencia

Este proyecto es parte de un trabajo académico para la materia de Desarrollo de Aplicaciones Móviles.

## Notas Adicionales

- Asegurar que las URLs del backend estén correctamente configuradas en el frontend
- Verificar que los permisos de la base de datos estén configurados correctamente
- Para producción, configurar variables de entorno apropiadas para las credenciales sensibles
