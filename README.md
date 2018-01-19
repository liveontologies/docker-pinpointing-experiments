


# docker-pinpointing-experiments

Docker image for pinpointing experiments.
It runs a simple HTTP server using which the experiments can be started.


# Quick start:
   (no need to clone the repository: a pre-compiled image will be downloaded from [docker.com](https://www.docker.com))
   ```
   docker run -d -p 8888:80 --name pinpointing-container liveontologies/pinpointing
   ```
   Open a web browser with the address http://localhost:8888/ or http://0.0.0.0:8888.   

# Prerequisites: 

- [docker](https://www.docker.com) for running the experiments container
- [java v.8+](http://java.com) and [maven v.3+](https://maven.apache.org/) for compiling the docker image

# How to build

1. Clone the repository
   ```
   git clone https://github.com/liveontologies/docker-pinpointing-experiments.git
   ```

1. Invoke the following command in the root directory of the repository:
    ```
    mvn clean install docker:build
    ```
    This command will create a docker image with name 'liveontologies/pinpointing',
    from which docker containers can be created and started.

# How to run

1. Invoke the following command:

    ```
    mvn docker:start
    ```

    This creates and runs the container with the experiments called
    `pinpointing-container`, which is accessible on the port `8888`.
    
    Alternatively, one can create and start the container using the 
    docker command shown in [Quick Start](#quick-start).
    There one can also change the port value `8888` or the name 
    `pinpointing-container` to different values.

1. Point your browser to the address of the host machine with the configured port,
    e.g., http://localhost:8888/.

1. Use the web interface to configure and run the experiments.

   While the container is running, one can connect to it from the shell,
   which is useful for inspecting the files in case of problems:

    ```
    docker exec -it pinpointing-container bash
    ```

 1. To stop the web server run:

    ```
    mvn docker:stop
    ```    
    
    If the contaner was started using the docker command, use:
    
    ```
    docker stop pinpointing-container
    ```
    
    Replace the name accordingly. To see all running use:
    
    ```
    docker ps
    ```
    
 1. To remove the container in case it is no longer needed run:
 
    ```
    mvn docker:remove
    ```
    
    or using the docker command:
    
    ```
    docker rm -v pinpointing-container
    ```
    
    Removing the container may take asome time. Please be patient.
    To see all available containers use:
    
    ```
    docker ps -a
    ```    
    
# See also

  - A complete list of [maven docker commands](https://dmp.fabric8.io/#maven-goals)
  - Run `docker --help`
  - Official [docker documentation](https://docs.docker.com)
  
