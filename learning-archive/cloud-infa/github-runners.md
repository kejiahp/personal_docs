# Setup github runner as a service on host machine

- run `sudo ./svc.sh install` // install the runner
- run `sudo ./svc.sh start` // then start it

Remember, this is the best way to go about it than using the ./run.sh script, as the runner will always be running in the background.

- run `sudo ./svc.sh status` // to confirm that the runner is up and running.

To uninstall the service

- run `sudo ./svc.sh uninstall`
