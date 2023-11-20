# Setting up WSL

1. In command prompt run => `wsl --install`

2. Restart System

3. Open the Ubuntu distro from the Start menu apps

4. Create Ubuntu user, username: your_username / password: your_password

5. Install most recent ubuntu packages: `sudo apt update`

6. Run the WSL terminal in VS Code and play around with that.
   i. commands to try `touch requirements.txt`, creates file
   ii. `touch main.css main.js` creates multiple files

7. Install ZSH and Oh My ZSH(for terminal styling optimization: it comes with git integration out of the box.).
   i. install zsh => `sudo apt install zsh`
   ii. install oh my zsh => `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

8. btw cd ~ brings you to the root path 😲

# Setting up Github Auth with SSH keys

1. ssh-keygen -t rsa -b 4096 -C "your.github.email"
2. Press enter
3. Copy the default directory where the SSH keys are stored, e.g. /home/username/.ssh/id_rsa
4. Provide SSH passphrase, i used something dumb🙂
5. cd ~/.ssh

#### Addig the private key to your ssh agent

---

5. eval $(ssh-agent -s)
6. ssh-add <ssh_private key>
7. cat into the .pub file to get the key.
8. go to your github /profile/settings/SSH and GPG keys add the pub key to github

So like the Chad i'm, i fucked the Setting Up Github Auth part up by providing a wrong email for the keygen command, so i had to start again...nice🙂

## Clean Up note: run the commands in the ssh directory, not necessary but to enhance copy and paste capabilities

1. i want to delete the ssh keys i created from github, my machine and the ssh agent
   i. view all keys added to ssh agent ssh-add -l or ssh-add -L
   ii. remove a specific key from the ssh-agent => ssh-add -d id_rsa
   iii. remove all keys from the ssh-agent => ssh-add -D
   iv. remove the ssh private key: rm id_rsa
   v. remove the ssh public key: rm id_rsa.pub
   vi. restart the process🥲
