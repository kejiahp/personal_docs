# Setting Up Docker for windows

1. Download Docker Desktop from the site.

2. Docker Installation
   1. Ensure WSL is already setup and running on your computer.
   2. Ensure your WSL distro version on WSL 2, you can check this by running `wsl.exe -l -v`, your distro version should be on 2, if not read microsoft docs on upgrading that.
   3. Install Docker desktop.
   4. Restart your machine, sign up or in on docker.

So like the nood i'm i went through the docker learning guide, so here are some of the things i learnt

---

- Container are isolated environments to run any code.
- Images are used to create containers and they are created from a Docker file and a sample of your application.
- Docker images are built with the docker build command e.g. `docker build -t welcome-to-docker .` the `-t` tags the image with a name. The `.` specifies the location of the dockerfile.
- Images generated can be run from the docker desktop file, though this people are joking they went ahead to use create react app for the image building example app instead of vite that thing takes like 2 years to build, especially on my trash PC 🥲🥲.
