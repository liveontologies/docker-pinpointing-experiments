


# docker-pinpointing-experiments

Docker image for pinpointing experiments.
It runs a simple HTTP server using which the experiments can be started.



# How to build

1. __(Optional)__ Add the binaries of pinpointing tools and
    the JAR with dependencies built from [pinpointing-experiments](https://github.com/liveontologies/pinpointing-experiments).
    Point the environmental variables in `Dockerfile` to them.
    Add one script for each pinpointing tool to the directory `experiments`.
    By default there are some binaries (see the variables in `Dockerfile`)
    and scripts (see directory `experiments`),
    so this does not need to be done if no change is needed.

1. Invoke the following command in the root directory of the repository:
    ```
    docker build -t pinpointing .
    ```



# How to run

1. Invoke the following command:
    ```
    docker run -d -p 80:80 --name pinpointing-container pinpointing
    ```
    This creates and runs the container with the experiments.
    If the host machine does not have the port 80 free,
    you can change the port to, let's say, 8080 by
    changing the value of the option `-p` to `80:8080`.

1. Point your browser to the address of the host machine,
    e.g., `http://localhost/`, or if you changed the port `http://localhost:8080/`.

1. Run the experiments.

1. Stop and remove the container by invoking:
    ```
    docker stop pinpointing-container && docker rm -v pinpointing-container
    ```




