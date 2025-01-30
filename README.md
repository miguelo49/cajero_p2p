# README

## Prerrequisitos

Asegúrate de tener instalados los siguientes componentes:

- Ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]
- Rails (versión 6.0 o superior)
- SQLite3

## Instalación de dependencias

Para instalar las dependencias necesarias, ejecuta el siguiente comando:

```sh
bundle install
```

## Configuración de la base de datos

Para configurar la base de datos SQLite3, ejecuta los siguientes comandos:

```sh
rails db:create
rails db:migrate
```

## Ejecutar la aplicación

Para correr la aplicación con Ruby, utiliza el siguiente comando:

```sh
rails server
```

Esto iniciará el servidor en `http://localhost:3000`.
