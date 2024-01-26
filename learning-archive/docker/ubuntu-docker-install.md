# Steps for installing docker on Ubuntu distro

### Installing docker

_RECOMMENDED_

- run `sudo apt-get install -y docker.io`

### Installing docker-compose

_RECOMMENDED_
run `mkdir -p ~/.docker/cli-plugins/`

run `curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose`

run `chmod +x ~/.docker/cli-plugins/docker-compose`

### To avoid typing sudo whenever you run the docker command, when not on root user

**to check username or user details**
run `whoami` or `who`

**add your username to the docker group**
run `sudo usermod -aG docker ${USER}`

OR

**add a user to the docker group that you’re not logged in as**
sudo usermod -aG docker <username>

**To apply the new group membership, log out of the server and back in, or type the following**
run `su - ${USER}`

**You will be prompted to enter your user’s password to continue.**

If the current user, doesn't have a password you can set one for the user and retry the process

- run `sudo su -` => command to go to root.
- run `passwd <user_name>` e.g. passwd ubuntu => set password for user ubuntu.
- Enter the users passord e.g. daddy123

**Confirm that your user is now added to the docker group by typing**
groups

**Change the permissions of docker socket to be able to connect to the docker daemon /var/run/docker.sock**
run `sudo chmod 666 /var/run/docker.sock`

### Option 2: Install both docker and docker-compose

run `sudo apt install docker.io docker-compose`

### Option 3: Use this blog

[Blog on installing Docker and Docker compose](https://itsfoss.com/install-docker-ubuntu "Precise and in dept")

### Verify the Docker and docker compose install on Ubuntu

docker --version
docker compose version
docker run hello-world
docker image rm -f hello-world
