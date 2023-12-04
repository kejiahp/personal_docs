# Installing python on WSL Ubuntu Distro

1. By default python comes on Ubuntu 20.04 and above.
2. To start things off we will be installing pip `sudo apt install -y python3-pip`.
3. now we can use `pip3 install <package_name>` or `pip install <package_name>` to install packages.
4. Some other important packages for our programming environment `sudo apt install build-essential libssl-dev libffi-dev python-dev`. Ubuntu told me `python-dev` doesn't exist or is deprecated so 🤷‍♂️.
5. install `sudo apt-get install libpq-dev python3-dev`, i think `python3-dev` is installed by default with Ubuntu latest and `libpq-dev` is required to use things like `psycopg2` with is a postgresql adapter.
6. We will be installing `sudo apt install -y python3-venv` for creating virtual environments. 
7. Command to create the virtual environments `python3 -m venv <venv_name>`. kinda different from what im used too though as a windows boi 😁.
8. We use `source <venv_name>/bin/activate` to activate our venv not the ./venv/Scripts/activate that im used to.
9. And youre set happy coding🐱‍🏍
