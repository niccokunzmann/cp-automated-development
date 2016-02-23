To remove all docker containers:

    docker ps -a | awk '{print $1}' | xargs --no-run-if-empty docker rm -f

To remove all docker images:

    docker images | awk '{print $3}' | xargs --no-run-if-empty docker rmi -f
