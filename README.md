# cp-automated-development

This is an automation of [cp-local-development](https://github.com/CoderDojo/cp-local-development). 
After you have installed it you can run the Zen platform locally.
Currently you have two options to use it:

- [Install cp-local-development locally](#local-installation)
- [Pull a docker container and try it out](#docker-container)

Local Installation
------------------

To install cp-local-development locally, [scripts](setup-zen) exist, tested under `Ubuntu 15.10`.
You can [download](https://github.com/niccokunzmann/cp-automated-development/archive/master.zip) this repository and run the install script in the [`setup-zen`](setup-zen) folder install your version of Zen on your machine. If the default values do not please you, you can edit the [`setup-zen/config.sh`](setup-zen/config.sh) beforehand.

Docker Container
----------------

You can find the docker container at [docker hub](https://hub.docker.com/r/coderdojo/cp-automated-development).

To install docker you can run [`setup-docker/01_install_docker.sh`](setup-docker/01_install_docker.sh). Then you should be able to run [`setup-docker/run_development_container.sh`](setup-docker/run_development_container.sh), which essentially does

    docker run -i -t coderdojo/cp-automated-setup

If you would like to renew the docker image in docker hub, you can execute

    curl -H "Content-Type: application/json" --data '{"build": true}' -X POST https://registry.hub.docker.com/u/coderdojo/cp-automated-development/trigger/a55a66b3-1863-49ab-a7a4-c50effd3a99d/
