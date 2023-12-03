# LAMP Docker

**Note: For the Spanish version of this README, please scroll down.**

This project provides a Dockerized environment for PHP application development with NGINX, MariaDB, and phpMyAdmin.

**Repository Composition**
- **nginx**: Contains NGINX configurations. You can modify the default.conf file to customize the web server configuration.

- **src**: Place your PHP source code in this directory.

- **docker-compose.yml**: Docker Compose configuration defining NGINX, PHP, MariaDB, and phpMyAdmin services.

- **Dockerfile**: PHP image build file.
.gitignore: File specifying files and directories to be ignored by Git.

- **README.md**: This file provides information about the project and how to use it.

##How to Use the Repository

1. **Clone the Repository:**
```bash
git clone https://github.com/your-username/lamp-docker.git
cd lamp-docker
```

2. **Run Docker Compose:**
```bash
docker-compose up -d
```
This will start the NGINX, PHP, MariaDB, and phpMyAdmin services.

3. **Access the Application:**
Your application will be available at http://localhost.
phpMyAdmin will be available at http://localhost:8080 (username: myuser, password: mypassword).

## Configuration
- **NGINX:**
You can customize the NGINX server configuration by modifying the nginx/default.conf file.

- **PHP:**
PHP configuration is based on the default settings of the base image. If you need to adjust the PHP configuration, consider creating a php.ini file in the ./src directory and mounting it into the container as needed.

## Database Access
**phpMyAdmin:**

Access phpMyAdmin at http://localhost:8080 with the credentials provided in the `docker-compose.yml` file.

## Import/Export Database
**PHPMyAdmin**

Use phpMyAdmin to import/export databases. Access phpMyAdmin at http://localhost:8080.

**Access MariaDB from the Terminal**

If you need to access the MariaDB database from the server terminal and perform operations like importing and exporting databases, you can follow these steps:

1. **Access the MariaDB Container:**

```bash
docker-compose exec mariadb bash
```

2. **Log in to MariaDB with User and Password:**

```bash
mysql -u your_user -p
```

Enter the password when prompted.

3. Once inside, you can run SQL commands directly.

**Export a Database**

To export a database to an SQL file, you can use the mysqldump command:

```bash
mysqldump -u your_user -p your_database_name > your_file.sql
```

Enter the password when prompted.

**Import a Database**
To import a database from an SQL file, you can use the `mysql` command:

```bash
mysql -u your_user -p your_database_name < your_file.sql
```

Enter the password when prompted.

Remember to replace `your_user`, `your_database_name`, and `your_file.sql` with your specific values.

These commands allow you to interact directly with the MariaDB database from the container's terminal. Once you have performed the necessary operations, you can exit the MariaDB session:

```bash
exit
```

These steps are useful for performing administration tasks directly from the MariaDB container terminal. Be sure to create backups and proceed with caution, especially in production environments.

## Use of Bind Mount and Docker Volume

**Bind Mount:**
The `nginx` and `src` directories use Bind Mount to allow real-time changes to code and configurations.

**Docker Volume:**
The MariaDB database uses a Docker Volume (`mariadb_data`) for data persistence.

Thank you for using LAMP Docker! If you encounter issues or have improvements, please create an issue or pull request.

## Changing the Database Password

- **By Docker-compose.yml**
Open your `docker-compose.yml` file and locate the mariadb service section.

Add or update the MYSQL_ROOT_PASSWORD and MYSQL_PASSWORD environment variables with the new passwords. For example:

```yaml
mariadb:
  image: mariadb:latest
  volumes:
    - mariadb_data:/var/lib/mysql
  environment:
    MYSQL_ROOT_PASSWORD: new_root_password
    MYSQL_DATABASE: my_database
    MYSQL_USER: my_user
    MYSQL_PASSWORD: new_user_password
  networks:
    - my_network
```

Replace `new_root_password` with the new password for the 'root' user and `new_user_password` with the new password for the specified user.

Save the `docker-compose.yml` file.

Restart the MariaDB service for the changes to take effect:

```bash
docker-compose restart mariadb
```

Now, the database password has been updated directly from the `docker-compose.yml` file. This approach is useful if you prefer managing passwords and configurations directly in the Docker Compose configuration file. Make sure the new passwords are secure and update any application settings that might depend on them.

## ------------ SPANISH VERSION ----------------

Este proyecto proporciona un entorno Dockerizado para el desarrollo de aplicaciones PHP con NGINX, MariaDB y phpMyAdmin.

## Composición del Repositorio

- **nginx:** Contiene configuraciones de NGINX. Puedes modificar el archivo `default.conf` para personalizar la configuración del servidor web.
- **src:** Coloca tu código fuente de PHP en este directorio.
- **docker-compose.yml:** Configuración de Docker Compose que define los servicios NGINX, PHP, MariaDB y phpMyAdmin.
- **Dockerfile:** Archivo de construcción de la imagen de PHP.
- **.gitignore:** Archivo que especifica los archivos y directorios que Git debe ignorar.
- **README.md:** Este archivo que proporciona información sobre el proyecto y cómo utilizarlo.

## Cómo Usar el Repositorio

1. **Clona el Repositorio:**
    ```bash
    git clone https://github.com/tu-usuario/lamp-docker.git
    cd lamp-docker
    ```

2. **Ejecuta Docker Compose:**

    ```
    docker-compose up -d
    ```
    Esto iniciará los servicios NGINX, PHP, MariaDB y phpMyAdmin.

3. **Accede a la Aplicación:**

    Tu aplicación estará disponible en http://localhost.
    phpMyAdmin estará disponible en http://localhost:8080 (usuario: myuser, contraseña: mypassword).


## Configuración
- **NGINX:**
Puedes personalizar la configuración del servidor NGINX modificando el archivo nginx/default.conf.

- **PHP:**
La configuración de PHP se basará en la configuración predeterminada de la imagen base. Si necesitas ajustar la configuración de PHP, considera crear un archivo php.ini en el directorio ./src y montarlo en el contenedor según sea necesario.

## Acceso a la Base de Datos
- **phpMyAdmin:**
Accede a phpMyAdmin en http://localhost:8080 con las credenciales proporcionadas en el archivo docker-compose.yml.

## Importar/Exportar Base de Datos

**PHPMyAdmin**
Utiliza phpMyAdmin para importar/exportar bases de datos. Puedes acceder a phpMyAdmin en http://localhost:8080.

**Acceder a MariaDB desde la Terminal**
Si necesitas acceder a la base de datos MariaDB desde la terminal del servidor y realizar operaciones como importar y exportar bases de datos, puedes seguir estos pasos:

1. **Accede al Contenedor de MariaDB:**

```bash
docker-compose exec mariadb bash
```

2. **Inicia Sesión en MariaDB con el Usuario y Contraseña:**

```bash
mysql -u tu_usuario -p
```
Ingresa la contraseña cuando se te solicite.

3. Una vez dentro, podrás ejecutar comandos SQL directamente.

**Exportar una Base de Datos**

Para exportar una base de datos a un archivo SQL, puedes usar el comando mysqldump:

```bash
mysqldump -u tu_usuario -p nombre_de_la_base_de_datos > nombre_del_archivo.sql
```
Ingresa la contraseña cuando se te solicite.

**Importar una Base de Datos**

Para importar una base de datos desde un archivo SQL, puedes usar el comando mysql:

```bash
mysql -u tu_usuario -p nombre_de_la_base_de_datos < nombre_del_archivo.sql
```

Ingresa la contraseña cuando se te solicite.

Recuerda reemplazar tu_usuario, nombre_de_la_base_de_datos y nombre_del_archivo.sql con tus valores específicos.

Estos comandos te permitirán interactuar directamente con la base de datos MariaDB desde la terminal del contenedor. Una vez que hayas realizado las operaciones necesarias, puedes salir de la sesión de MariaDB:

```bash
exit
```
Estos pasos son útiles para realizar tareas de administración directamente desde la terminal del contenedor de MariaDB. Asegúrate de realizar copias de seguridad y proceder con precaución, especialmente en entornos de producción.

## Uso de Bind Mount y Volumen de Docker

**Bind Mount:**
Los directorios nginx y src usan Bind Mount para permitir cambios en tiempo real en el código y configuraciones.

**Volumen de Docker:**
La base de datos MariaDB utiliza un Volumen de Docker (mariadb_data) para persistencia de datos.
¡Gracias por utilizar LAMP Docker! Si encuentras problemas o mejoras, por favor, crea un issue o una pull request.

## Cambiar la Clave de la Base de Datos
-**Por Docker-compose.yml**
Abre tu archivo docker-compose.yml y localiza la sección del servicio mariadb.

Agrega o actualiza las variables de entorno MYSQL_ROOT_PASSWORD y MYSQL_PASSWORD con las nuevas contraseñas. Por ejemplo:

```yaml
mariadb:
  image: mariadb:latest
  volumes:
    - mariadb_data:/var/lib/mysql
  environment:
    MYSQL_ROOT_PASSWORD: nueva_contraseña_root
    MYSQL_DATABASE: my_database
    MYSQL_USER: my_user
    MYSQL_PASSWORD: nueva_contraseña_usuario
  networks:
    - my_network
```

Sustituye *'nueva_contraseña_root'* con la nueva contraseña para el usuario *'root'* y *'nueva_contraseña_usuario'* con la nueva contraseña para el usuario especificado.

Guarda el archivo `docker-compose.yml`.

Reinicia el servicio MariaDB para que los cambios surtan efecto:

```bash
docker-compose restart mariadb
```

Ahora, la contraseña de la base de datos se ha actualizado directamente desde el archivo docker-compose.yml. Este enfoque es útil si prefieres gestionar las contraseñas y configuraciones directamente en el archivo de configuración de Docker Compose. Asegúrate de que las nuevas contraseñas sean seguras y de actualizar cualquier configuración de aplicación que pueda depender de ellas.