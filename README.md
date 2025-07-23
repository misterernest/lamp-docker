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

## Troubleshooting
### Permission Issues with src Folder in WSL/Docker

If you're using **WSL** and encounter errors when trying to create or modify files in the `src` folder (e.g., from VS Code), it's likely a **permission issue** where the `src` folder is owned by `root` instead of your WSL user.

**Problem Example (from `ls -la` output):**
```
drwxr-xr-x 2 root            root             4096 Jul 23 11:53 src
```
*(Notice root as the owner)*

**Solution:** Change the ownership of the `src` folder (and its contents) to your WSL user.

1. **Open your WSL terminal.**

2. **Navigate to your project `root`:**

```bash
cd /home/your_wsl_user/code/book-share # Replace with your actual path
```

3. **Change the ownership of src recursively:**

```Bash
sudo chown -R your_wsl_user:your_wsl_user src
```
*(Replace your_wsl_user with your actual WSL username, e.g., linux-support).*

4. **Verify permissions (optional):**

```Bash
ls -la
```

You should now see src owned by your user:
```bash
drwxr-xr-x 2 your_wsl_user your_wsl_user 4096 Jul 23 11:53 src
```

5. **Restart VS Code (or reconnect to container):** Close and reopen VS Code, or if connected via Dev Containers, reconnect to ensure the new permissions are recognized.

Thank you for using LAMP Docker! If you encounter issues or have improvements, please create an issue or pull request.
