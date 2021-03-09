# Demo project (Docker + CI/CD)

## Getting Started
### Installation guide
##### System requirements
- [Docker Engine](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- git

#### Setup
- Clone this repository
```shell script
git clone https://github.com/Streonix/demo_project.git
```
- Open project root folder
```shell script
cd <path/to/the/project>
```
- Run the docker build and up the docker container
```shell script
docker-compose up --profile prod --build -d
```
