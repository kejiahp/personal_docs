# Setting up WSL

1. In command prompt run => `wsl --install`

2. Restart System

3. Open the Ubuntu distro from the Start menu apps

4. Create Ubuntu user, username: your_username / password: your_password

5. Install most recent ubuntu packages: `sudo apt update` or `sudo apt upgrade` to upgrade packages

6. Run the WSL terminal in VS Code and play around with that.
   i. commands to try `touch requirements.txt`, creates file
   ii. `touch main.css main.js` creates multiple files

7. Install ZSH and Oh My ZSH(for terminal styling optimization: it comes with git integration out of the box.).
   i. install zsh => `sudo apt install zsh`
   ii. install oh my zsh => `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

8. btw `cd ~` brings you to the user path within `\\wsl.localhost\<Distro>\home\<Username>` 😲 while `cd /` brings you to the root distro path `\\wsl.localhost\Ubuntu`.

you can run `explorer.exe .` to open up a path in file explorer

# Setting up Github Auth with SSH keys

1. `ssh-keygen -t rsa -b 4096 -C "your.github.email"` to create ssh keys
2. Press enter
3. Store the directory where the SSH keys are stored, e.g. `/home/<username>/.ssh/id_rsa`
4. Provide SSH passphrase, i used something dumb🙂
5. `cd ~` to move into `\\wsl.localhost\<Distro>\home\<Username>` followed by `cd .ssh` to move into where ssh keys

#### Adding the private key to your ssh agent

---

6. `eval $(ssh-agent -s)` i don't remember what this command is for maybe to init the agent 🤷.
7. `ssh-add <ssh_private key>` to add the private key to the ssh agent
8. cat into the .pub file to get the key.
9. go to your `github /profile/settings/SSH and GPG keys` page add the pub key to github

So like the Chad i'm, i fucked the Setting Up Github Auth part up by providing a wrong email for the keygen command, so i had to start again...nice🙂

#### 30 mins later

so after restarting the whole process i realized the email that is provided with the keygenn is just a tag to easily spot or identify the key.

## Clean Up note: run the commands in the ssh directory, not necessary but to enhance copy and paste capabilities

- I will delete the ssh keys i created from github, my machine and the ssh agent
- view all keys added to ssh agent `ssh-add -l` or `ssh-add -L`
- remove a specific key from the ssh-agent => `ssh-add -d id_rsa`
- remove all keys from the ssh-agent => `ssh-add -D`
- remove the ssh private key: `rm id_rsa`
- remove the ssh public key: `rm id_rsa.pub`
- restart the process🥲

NOTE:

- cache git credentials for an hour => `git config --global credential.helper cache -timeout=3600`
