To remove all docker containers:

    docker ps -a | awk '{print $1}' | xargs --no-run-if-empty docker rm -f

To remove all docker images:

    docker images | awk '{print $3}' | xargs --no-run-if-empty docker rmi -f

To renew the online version of the container coderdojo/cp-automated-development

    curl -H "Content-Type: application/json" --data '{"build": true}' -X POST https://registry.hub.docker.com/u/coderdojo/cp-automated-development/trigger/a55a66b3-1863-49ab-a7a4-c50effd3a99d/
