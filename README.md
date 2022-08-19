<img width="300px" align="right" alt="logo_mmmv" src="https://mmartinezdev.com/images/logo_white.png">

# Deploy Docker CI/CD para VPS (Ubuntu, Debian) - Traefik y Portainer

Despliegue de ingeniería de software utilizando Docker para una integración más rápida

### MTIE. Miguel Manuel Martínez Vázquez 👨‍💻

###

[![Versión](https://img.shields.io/badge/Versión-1.0.0-blue.svg)](https://github.com/djmai/deploy-docker-traefik-portainer/releases/tag/Deploy-CI-CD-v1.0.0)
[![Whatsapp](https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white)](https://wa.link/7trr5f)

[![donate](https://www.paypalobjects.com/es_ES/i/btn/btn_donate_SM.gif)](https://paypal.me/IngMiguelMartinez?locale.x=es_XC)
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/W7W86SX6E)

_Este repositorio contiene todo el despliegue de Integración y Distribución Continuas (CI/CD), los cuales son subconjuntos diferenciados de tareas agrupadas en lo que se conoce como etapas del canal._

## Introducción

Este proyecto hace uso de los siguientes componentes por medio del uso de contenedores y despliegue de aplicaciones.

- ✅ Docker
- ✅ Docker Compose
- ✅ Traefik
- ✅ Portainer

## Enlaces rápidos

- [Comenzando 🚀](#Comenzando)
  - [Pre-requisitos 📋](#Pre-requisitos)
- [Instalación 🔧](#Instalación)
  - [Ejecución Rápida 🚀](#Speed)
- [Despliegue 📦](#Despliegue)
  - [Primer Inicio ✔️](#Start)
  - [Ya tienes Docker ❓](#Docker?)
- [Configuraciones YAML 📄](#YAML)
  - [docker-compose.yml](#docker-compose)
  - [traefik.yml](#traefik-yml)
  - [dynamic.yml](#dynamic-yml)
- [Construido con 🛠️](#Construido)
- [Contribuyendo 🖇️](#Contribuyendo)
- [Wiki 📖](#Wiki)
- [Versionado 📌](#Versionado)
- [Autores ✒️](#Autores)
- [Licencia 📄](#Licencia)
- [Expresiones de Gratitud 🎁](#Gratitud)

<a name="Comenzando"></a>

## Comenzando 🚀

Como obtener una copia del repositorio completo para trabajar de forma local si te agrada lo que he desarrollado.

Para crear la carpeta de `deploy-docker-traefik-portainer` e instalar los requerimientos sólo clona el repo:

```bash
# Clona el repo desde tu terminal (carpeta-> deploy-docker-traefik-portainer):
> git clone https://github.com/djmai/deploy-docker-traefik-portainer.git

# Clona el repo desde tu terminal (carpeta-> nombre_personalizado):
> git clone https://github.com/djmai/deploy-docker-traefik-portainer.git nombre_personalizado
```

```bash
# Clona el repo desde Github Desktop (Windows):
1. Inicia sesión en GitHub y GitHub Desktop antes de comenzar la clonación.

2. En GitHub, visita la página principal del repositorio.

3. Sobre la lista de archivos, da clic en  Código.

4. Clic en Open with GitHub Desktop para clonar y abrir el repositorio con with GitHub Desktop.

5. Haz clic en Choose... (Elegir...) y, a través de Windows Explorer, desplázate hasta la ruta donde deseas clonar el repositorio.

6. El botón Clone (Clonar)
```

Mira **Programador** 👨‍💻 2para conocer como desplegar el proyecto.

<a name="Pre-requisitos"></a>

### Pre-requisitos 📋

_Para poder realizar el despliegue correctamente del proyecto ocuparemos lo siguiente_

```bash

- Herramientas de terminal
  - git
  - curl

- Sistemas Operativos

  - Windows 10 Pro (Opcional)
    - Memoria RAM 4GB Mínimo
    - Disco Duro 500GB Mínimo
    - Procesador Intel o AMD

  - Distribución Linux (Ubuntu, Debian, etc.)
    - Memoria RAM 4GB Mínimo
    - Disco Duro 500GB Mínimo
    - Procesador Intel o AMD

- Software

  - [Docker ](https://docs.docker.com/engine/install/)
  - [Docker Compose](https://docs.docker.com/compose/install/compose-plugin/)

```

<a name="Instalación"></a>

## Instalación 🔧

<a name="Speed"></a>

#### Ejecución Rápida ⚡

```bash

# Accedemos al a carpeta del proyecto clonado (carpeta-> nombre_personalizado)
> cd deploy-docker-traefik-portainer

# Ejecutamos los siguientes comandos para una ejecución y despliegue rápido
> chmod +x 01-initial.sh 02-deploy.sh && ./01-initial.sh

```

<a name="Despliegue"></a>

### Despliegue 🐳

Entrar a la carpeta creada al clonar el repositorio.
Dentro de la carpeta hay dos archivos con los nombres 01-initial.sh y 02-deploy.sh, para ello hay que asignarles permisos de ejecución a ambos archivos.

```bash

# Asignar permiso de ejecución a ambos archivos
> chmod +x 01-initial.sh 02-deploy.sh

```

<a name="Start"></a>

#### Primer Inicio ✔️

Para comenzar por primera vez el despliegue del proyecto, dentro de este mismo se encuentra un archivo de tipo bash, el cual ejecutaremos al inicio y seguir los pasos que nos va preguntado la secuencia de comandos,si ya cuentas con docker instalado y quieres desplegar el proyecto de Traefik y Portainer ve a la siguiente sección [_Ya tienes Docker?_](#Docker?)


> 01-initial.sh

```bash
# Este archivo realiza la instalación y configuración de docker y de un nuevo usuario
# el cual tendra los privilegios para iniciar docker
> ./01-initial.sh
```

Este archivo lo que hará sera ejecutar complemente todo lo necesario para poder hacer el despliegue de los contenedores y todo lo necesario paso a paso y poder continuar con la ejecución del 02-deploy.sh

<a name="Docker?"></a>

#### Ya tienes Docker ❓

Para realizar una actualizacion del repositorio, ejecute el archivo de tipo bash que se encuentra en este mismo proyecto, para que ejecute la actualizacion correctamente sin problemas

> 02-deploy.sh

```bash
# Este archivo contiene todo lo necesario para realizar las configuraciones y despliegue de los contenedores de Traefik y Portainer

# Ejecuta este archivo solamente si ya tienes instalado docker, si es una instalación limpia no te preocupes en tener que ejecutar este archivo solo ejecuta el archivo 01-initial.sh y sigue las instrucciones

> ./02-deploy.sh
```

<a name="Comandos-Docker"></a>

## Comandos Docker

| Comando                                  | Descripción                                                        |
| ---------------------------------------- | ------------------------------------------------------------------ |
| docker ps                                | Listado de los contenedores que están corriendo                    |
| docker ps -a                             | Listado de todos los contenedores                                  |
| docker start CONTENEDOR                  | Inicializa el contenedor                                           |
| docker stop CONTENEDOR                   | Detiene el contenedor                                              |
| docker restart CONTENEDOR                | Reinicia el contenedor                                             |
| docker pause CONTENEDOR                  | Suspende todos los procesos del contenedor especificados           |
| docker unpause CONTENEDOR                | Reanuda todos los procesos dentro del contenedor                   |
| docker kill CONTENEDOR                   | Envía una señal SIGKILL al contenedor                              |
| docker logs --follow --tail n CONTENEDOR | Muestra el número de líneas indicadas del registro de salida (log) |
| docker stop $(docker ps -a -q)           | Detiene todos los contenedores                                     |
| docker rm -f $(docker ps -qa)            | Elimina todos los contenedores                                     |
| docker images                            | Listado de imágenes con su nivel, repositorio, etiquetas y tamaño  |
| docker image rm IMAGEN                   | Elimina la imágen                                                  |
| docker rmi -f $(docker images -a -q)     | Eliminar todas las imagenes del repositorio                        |

<a name="YAML" />

## Configuraciones YAML 📄

En esta sección se encuentras las configuraciones mas importantes para poder personalizar el proyecto si no requieren que el proyecto se despliegue dese los archivos de 01-initial.sh y 02-deploy.sh


<a name="docker-compose" />

### Docker-Compose

El archivo docker-compose.yml se encuentra dentro de la carpeta core y este archivo se puede ejecutar desde su ubicación actual usando el siguiente comando

```bash

# Fuera de la carpeta del proyecto
# Ejemplo: docker compose -f /home/usuario/CARPETA/core/docker-compose.yml up -d
> docker compose -f RUTA_ARCHIVO up -d

# Dentro de la carpeta del proyecto
# Ejemplo: docker compose -f core/docker-compose.yml up -d
> docker compose -f core/docker-compose.yml up -d

# Dentro de la carpeta core
> docker compose up -d

```

Dentro del archivo  docker-compose.yml se puede configurar lo siguiente para contenedor que se vaya a levantar, todo esto dentro de las etiquetas del contenedor

```bash

  # Contenedor Traefik (Ejemplo)
  traefik:
    image: traefik:latest
    .
    .
    .
    labels:
      - "traefik.enable=true"
      - "traefik.docker.network=proxy"
      - "traefik.http.routers.traefik-secure.entrypoints=websecure"
      # Cambiar DOMAIN_TRAEFIK por el nombre del dominio para traefik
      - "traefik.http.routers.traefik-secure.rule=Host(`DOMAIN_TRAEFIK`)"
      - "traefik.http.routers.traefik-secure.middlewares=user-auth@file"
      - "traefik.http.routers.traefik-secure.service=api@internal"

  # Contenedor Portainer (Ejemplo)
  portainer:
    image: portainer/portainer-ce:latest
    .
    .
    .
    labels:
      - "traefik.enable=true"
      - "traefik.docker.network=proxy"
      - "traefik.http.routers.portainer-secure.entrypoints=websecure"
      # Cambiar DOMAIN_PORTAINER por el nombre del dominio para portainer
      - "traefik.http.routers.portainer-secure.rule=Host(`DOMAIN_PORTAINER`)" 
      - "traefik.http.routers.portainer-secure.service=portainer"
      - "traefik.http.services.portainer.loadbalancer.server.port=9000"

```

<a name="traefik-yml" />

### Traefik YAML

El archivo traefik.yml se encuentra dentro de la carpeta core/traefik-data donde se puede personalizar de forma manual lo siguiente

```bash
api:
  dashboard: true

entryPoints:
  web:
    address: :80
    .
    .
    .
certificatesResolvers:
  letsencrypt:
    acme:
      # Cambiar USER_EMAIL_LETSENCRYPT por el correo electronico que se usara para los
      # certificados SSL
      email: USER_EMAIL_LETSENCRYPT
      storage: acme.json
      keyType: EC384
      httpChallenge:
        entryPoint: web

```

<a name="dynamic-yml" />

### Dynamic YAML

El archivo dynamic.yml se encuentra dentro de la carpeta core/traefik-data/configurations en este archivo se pueden realizar varias configuraciones manuales las cuales son las siguientes

```bash
# Dynamic configuration
http:
  middlewares:
    secureHeaders:
      headers:
        sslRedirect: true
        forceSTSHeader: true
        stsIncludeSubdomains: true
        stsPreload: true
        stsSeconds: 31536000

    user-auth:
      basicAuth:
        users:
          # Cambiar USER_BASIC_AUTH por el usuario y la contraseña que te genera 
          # en el script de bash al momento de su ejecución, la contaseña es un bash
          # así que no todas son iguales
          # Ejemplo: usuario:0YHQsSDRj9C90YMgMzAgMTk6NTE
          - "USER_BASIC_AUTH"

tls:
  options:
    default:
      cipherSuites:
        - TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
        - TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        - TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
        - TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        - TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305
        - TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305
      minVersion: VersionTLS12

```

<a name="Construido" />

## Construido con 🛠️

_Utilizamos las siguientes herramientas para desarrollar este proyecto_

- [Docker](https://www.docker.com/) - Plataforma abierta para desarrollar, enviar y ejecutar aplicaciones.
- [Docker Compose](https://docs.docker.com/compose/install/) - Herramienta para definir y ejecutar aplicaciones Docker de varios contenedores.
- [Traefik](https://hub.docker.com/_/traefik) - Es un proxy inverso HTTP moderno y un equilibrador de carga que facilita la implementación de microservicios.
- [Portainer](https://hub.docker.com/r/portainer/portainer) - Es una herramienta web open-source que permite gestionar contenedores Docker

<a name="Contribuyendo" />

## Contribuyendo 🖇️

Por favor lee el [CONTRIBUTING.md](https://gist.github.com/djmai/MMMV-CICD/CONTRIGUTING.md) para detalles de nuestro código de conducta, y el proceso para enviarnos pull requests.

<a name="Wiki" />

## Wiki 📖

Puedes encontrar mucho más de cómo utilizar este proyecto en nuestra [Wiki](https://github.com/djmai/deploy-docker-traefik-portainer/wiki)

<a name="Versionado" />

## Versionado 📌

Usamos [SemVer](http://semver.org/) para el versionado. Para todas las versiones disponibles, mira los [tags en este repositorio](https://github.com/djmai/deploy-docker-traefik-portainer/tags).

<a name="Autores" />

## Autores ✒️

_Menciona a todos aquellos que ayudaron a levantar el proyecto desde sus inicios_

- **Ing. Miguel Martinez** - [djmai](https://github.com/djmai)

También puedes mirar la lista de todos los [contribuyentes](https://github.com/djmai/deploy-docker-traefik-portainer/CONTRIBUTING.md) quienes han participado en este proyecto.

<a name="Licencia" />

## Licencia 📄

<a name="Gratitud" />

## Expresiones de Gratitud 🎁

- Comenta a otros sobre este proyecto 📢
- Invita una cerveza 🍺 o un café ☕ a alguien del equipo.
- Da las gracias públicamente 🤓.
- etc.

---

⌨️ con ❤️ por [Ing. Miguel Martinez](https://github.com/djmai) 😊
