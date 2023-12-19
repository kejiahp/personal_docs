# Setting Up Docker for windows

1. Download Docker Desktop from the site.

2. Docker Installation
   1. Ensure WSL is already setup and running on your computer.
   2. Ensure your WSL distro version on WSL 2, you can check this by running `wsl.exe -l -v`, your distro version should be on 2, if not read microsoft docs on upgrading that.
   3. Install Docker desktop.
   4. Restart your machine, sign up or in on docker.

So like the noob i am, i went through the docker learning guide, so here are some of the things i learnt

---

#### Container and Images

- Container are isolated environments to run any code.
- Images are used to create containers and they are created from a Docker file and a sample of your application.
- Docker images are built with the docker build command e.g. `docker build -t welcome-to-docker .` the `-t` tags the image with a name. The `.` specifies the location of the dockerfile.
- Images generated can be run from the docker desktop file, though this people are joking they went ahead to use create react app for the image building example app instead of vite that thing takes like 2 years to build, especially on my trash PC 🥲🥲.
- You can also search up other peoples images from docker hub, build the container and run them, using the search bar you find at the top of the Desktop app.

#### Docker Compose

- **Docker compose** allows the starting of multiple docker container with a single command.
- The `docker compose up -d` command runs all services specified in the docker compose file and creates a container for the application. The `-d` runs docker in detached mode. This basically runs the container in the background. So if i delete the container created running the `docker compose up` will spin up the container again.
- side note the docker compose file read .envs in the same root as it self so you can use variables directly in the compose file

#### Docker Volumes

- Docker isolates all content in a container from the local file system therefore, once a container is deleted the content is gone to persist the content you can use **volumes**.
- A **volume** is a location in your local file system managed by docker, docker volumes can be added through the `compose.yml` file.

##### More Volumes Explanation

```
services:
  todo-database:
    image: mongo:6
    volumes:
      - database:/data/db
    ports:
      - 27017:27017
  volumes:
   database:
```

Digging deeper

---

The volumes element that is nested in **todo-database** tells Compose to mount the volume named **database** to **/data/db** in the container for the **todo-database** service.

The **top-level volumes** element defines and configures a volume named **database** that can be used by any of the services in the Compose file.

#### Bindmounts

- Due to dockers isolated architecture in order for us to access our local file system from within a container we use **bindmounts**.
- **Bindmounts** lets you share a directory from your host's filesystem into the container.

#### More Bindmount Explanation

```
todo-app:
    # ...
    volumes:
      - ./app:/usr/src/app
      - /usr/src/app/node_modules
```

Digging deeper

---

The volumes element tells Compose to mount the local folder ./app to /usr/src/app in the container for the todo-app service. This particular bind mount overwrites the static contents of the /usr/src/app directory in the container and creates what is known as a development container. The second instruction, /usr/src/app/node_modules, prevents the bind mount from overwriting the container's node_modules directory to preserve the packages installed in the container.

- **Bindmounts** allow us to take advantage of the container’s environment while we develop the app on we local system. Any changes we make to the app on our local system are reflected in the container.

#### Containerizing our apps

- we use `docker init` to create the Dockerfile, .dockerignore and compose.yml files with default language based content.
- `docker compose up --build` or `docker compose up` to start the app and make the container.
- `docker compose down` to stop and remove containers and networks (optionally images and volumes as well) use the `docker compose down --volumes` to remove volumes also. `docker-compose down --rmi <all|local>` to remove images
  `docker-compose start` - command will only restart containers stopped previously

`docker-compose stop` - command will stop running containers but won’t remove them

#### Publishing docker images

- select the image from Docker desktop locate the pull button
- rename the image before publishing to docker hub `docker tag docker/welcome-to-docker YOUR-USERNAME/welcome-to-docker`
- publish the image
