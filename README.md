## Part 1. Ready-made docker

Take the official docker image from nginx and download it using `docker pull`

![](./images/pull_nginx.png)

Check for the docker image with `docker images`

![](./images/docker_images.png)

Run docker image with `docker run -d [image_id|repository]`
Check that the image is running with `docker ps`

![](./images/docker_run.png)

View container information with `docker inspect [container_id|container_name]`

![](./images/inspect_awesome.png)
![](./images/network_settings.png)
![](./images/sgared_memory.png)

- container size: *67108864 bytes*
- list of mapped ports: *none*
- container ip: *172.17.0.2*

Stop docker image with `docker stop [container_id|container_name]`
Check that the image has stopped with `docker ps`

![](./images/docker_stop.png)

Run docker with mapped ports `80` and `443` on the local machine with `run` command

Check that the nginx start page is available in the browser at `localhost:80`

![](./images/nginx_port80.png)

Restart docker container with `docker restart [container_id|container_name]`

![](./images/docker_restart.png)

## Part 2. Operations with container

Read the nginx.conf configuration file inside the docker container with the `exec` command

![](./images/cat_nginx_conf.png)

Create a nginx.conf file on a local machine \
Configure it on the `/status` path to return the nginx server status page

![](./images/nginx_status_conf.png)

Copy the created nginx.conf file inside the docker image using the `docker cp` command \
Restart nginx inside the docker image with `exec`

![](./images/nginx_status_page.png)
![](./images/localhost_status.png)

Export the container to a container.tar file with the `export` command \
![](./images/export_container.png)

Stop the container

![](./images/stop_panini.png)

Delete the image with `docker rmi [image_id|repository]` without removing the container first

![](./images/delete_nginx_image.png)

Delete stopped container

![](./images/remove_panini.png)

Import the container back using the `import` command

Run the imported container

Check that localhost:80/status returns the nginx server status page

![](./images/docker_run_imported_cont.png)

![](./images/imported_cont_suc.png)

## Part 3. Mini web server

Here I use nginx docker image to setup my mini fcgi server

![](./images/3_start_nginx_container.PNG)

Open the container via VS Code

First we need to install all necessary packages

![](./images/3_open_container_in_code.PNG)  
<!-- vscode image -->

- apt update
- gcc
- libfcgi-dev
- spawn-fcgi

We add a new virtual server to the nginx config file as shown in `./03/nginx/nginx.conf`
So now all requests from `81` will be redirected to `8080`

Create a c file that will produce the web page `./03/fcgi_hello.c`

And then compile it and "feed" it to spawn-fcgi

`gcc -lfcgi fcgi_hello.c -o fcgi_hello.out`

`spawn-fcgi -a 127.0.0.1 -p 8080 ./fcgi_hello.out`

![](./images/3_hello_fcgi_page.PNG)


## Part 4. Your own docker

![](./images/docker_build_fcgi_hello.PNG)
![](./images/image_build_success_v1.PNG)
![](./images/nginx_conf_with_status_on.PNG)
![](./images/fcgi_serv_with_nginx_status.PNG)

## Part 5. Dockle

![](./images/5_dockle_errors.PNG)

little corrections :)

![](./images/5_fine_dockerfile.PNG)

and voilà

![](./images/5_dockle_success.PNG)

## Part 6. Basic Docker Compose

![](./images/reverse_proxy_success.PNG)
![](./images/docke-compose_success.PNG)
