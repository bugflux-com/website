---
title: Installation
description: Bugflux installation guide.
category: Getting started
layout: guide
order: 01.10
---
* [Installation with setup](#Installation-with-setup)
 * [Windows](#Windows)
* [Installation manually](#Installation-manually)
 * [PHP and Composer](#PHP-and-Composer)
 * [Database](#Database)
 * [Server](#Server)
* [After installation](#After-installation)
  
## Installation with setup

Bugflux setup can be downloaded from [GitHub](https://github.com/bugflux-com?q=setup-). 

If you want to use our setup to install and configure Bugflux you should download setup for you operating system, which contains whole application within itselt. Our setups configure Bugflux to use nginx server and SQLite database. **Installation do not configure any system service, directory or variable** - it make chages only in specified installation directory.

Every setup contains `README.md` file with description of setup process in more detail.

### Windows

Windows setup contains `bugflux-setup.bat` script which should be run to install bugflux.

Example usage: 
```
bugflux-setup.bat C:\Users\John 3010 9124
```

**First parameter is a path**, where to install Bugflux, **second is a port number on which nginx will listen** and third parameter is a port on which php-cgi will listen (required by nginx). First parameter is required, while others are optional. Default value for nginx port is 80, but we recommend to change it to avoid port blocking problems, because 80 is also default port for many other servers. Default value for php-cgi is 9123.

Setup downloads PHP and nginx, so if you already have nginx hosting your sevices it would be better to download just Bugflux application and configure nginx manually.

Use `run_bugflux.bat` script in installation directory to run php-cgi and nginx. Use `shutdown_bugflux.bat` script to shutdown them.

If you want to uninstall Bugflux, all you need to do is deleting bugflux directory. Be careful! This will delete all your data collected by the server.


## Installation manually

Bugflux application can be downloaded from [GitHub](https://github.com/bugflux-com/server). Bugflux is written in PHP (requires version at least 5.5.9) and uses Laravel framework which documentation can be found [here](https://laravel.com/docs/5.3). 

### PHP and Composer

In `php.ini` file for PHP which will be used by Bugflux some extensions should be uncommented. They are: `php_curl.dll`, `php_intl.dll`, `php_fileinfo.dll`, `php_mbstring.dll`, `php_exif.dll`, `php_openssl.dll`, `php_gd2.dll` (remember also to set extension dir, eq. on Windows uncomment `extension_dir = "ext"`). 

Firsty you should download Bugflux depedencies (incuding Laravel) with Composer - depedency manager for PHP. To do so, [download](https://getcomposer.org/download/) and install Composer. Write in command line in directory where you unzipped Bugflux application:
```
composer install --prefer-dist --no-dev
```

It can take a while to install all depedencies.

### Database

Secondly you should prepare your database. Choose one of: MySQL, Postgres, SQLite, SQL Server (they are supported by Laravel). Laravel documentation on how to configure database is [here](https://laravel.com/docs/5.3/database). 

Configure php.ini to use chosen database. For example, in case of SQLite you should uncomment extensions `php_pdo_sqlite.dll` and `php_sqlite3.dll`.

You should copy `env.example` file and name it `.env` and then make necessary changes in it.
For example if you want to use SQLite database you don't need to change anything in this file - it's default content related to database is enought: `DB_CONNECTION=sqlite`

You should also create your database before Bugflux wants to use it. SQLite database can be created by running command in database directory: 
```
php -r "$database=new SQLite3('database.sqlite');"
```

After that new file `database.sqlite` will appear. 

Creating other databases is not so easy, first of all you will probably have to download database. We assume that if you choose other database than SQLite you know how to use it.

When you have your database prepared, you should generate key for application, migrate and seed database:
```
php artisan key:generate
php artisan migrate
php artisan db:seed
```

### Server

At the and configure your server. In Bugflux directory, **`public` folder should be document root**.

Example configuration for nginx listening on 3010 port, php-cgi listening on 9124 port and Bugflux unzipped in `C:\Users\John`:

```
worker_processes  1;
 

events {
    worker_connections  1024;
}
 
http {
    keepalive_timeout  65;
 
    server {
        listen       3010;
        server_name  bugflux;
        root         C:\Users\John\bugflux\app\public;
 
        location / {
            index  index.php index.html index.htm;
            try_files $uri $uri/ /index.php?$args;
            include mime.types;
        }
 
        location ~ \.php$ {
            fastcgi_pass   127.0.0.1:9124;
            fastcgi_index  index.php;
            include        fastcgi.conf;
        }
    }
}
```

Change also `cgi.fix_pathinfo=1` to `cgi.fix_pathinfo=0` in `php.ini` if you want to use nginx.

If you choose other server, check how to configure it with PHP and Laravel. 


## After installation

If there are no errors you ought to go to bugflux login page (if you installed Bugflux with setup the address should be `localhost:chosen_port` where `chosen_port` is port for nginx). Then you can login as administrator using e-mail: `root@bugflux.com` and password: `secret`. You should change these credentials (at least password), add a new project and at least one person who will be a project manager.

If there are errors, please [contact us](mailto:support@bugflux.com) in order to resolve problem together.