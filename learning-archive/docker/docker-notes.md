# NOTE TAKEN WHILE LEARNING DOCKER

1. `docker run <image_name>` pulls an image from docker hub then starts a container for that image
2. `docker run -p 8080:80 <image_name>` does the same as a bove but the `-p` flag exposes the port of the image then we expose the default port of the image which is port 80 on port 8080 on our machine. In this example the image is nginx.
3. So in scenario were we want to work with VM e.g. debian, ubuntu or gentoo💀. We can pull it from docker hub using the `docker pull <image_name[:version]>` then instead of running the container and exposing it through a port like we did previously with nginx, we enter the interactive shell of the VM using `docker run -it <vm_name> /bin/bash`. **NOTE**: the `-it` flag isn't perculiar to VM, you can also access the shell of nginx or even python. if youre in an IT use `exit` to come out.
4. Just a quick reminder containers are isolated so if you install something on a VM, then run another container with `docker run` those two will not share packages.
5. When building images  we could use `docker build -f Dockerfile <other flags e.g -t>` to specify the file to be used for the image blueprint, this is done by the `-f` tag.
6. Using docker compose we can build individual services using the `docker compose build <service_name>`
7. `docker compose watch` this watchs a particular directory or file and re-creates the container as the content of the file changes. The watch command requires configuartion in the docker compose file.Ensure the details match the `COPY` command in the Dockerfile especially the source dir.
e.g. `COPY ./src .` for the example below

Below is an example of this configuration:

```
services:
  server:
    build:
      ...
    ports:
      ...
    develop:
      watch:
        - action: "rebuild"
          path: ./src
          target: /app
```

`action` determine the container building operation, `path` is the path to observe for changes and `target` is the target for the application in the container.

8. `docker exec -it <container_id>` or `docker compose exec -it <service_name> /bin/bash` when a container is running can be used to access the container shell rather than the `-it` flag.
9. `docker ps` is used to view what is currently running.
10. `docker compose logs` to view docker logs
11. env files with docker

```
services:
  server:
    build:
      context: .
    ports:
      - 8000:8000
    env_file:
      - ./.env
```