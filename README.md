# Football API project

API project to study and enjoy Elixir and Phoenix.
Developed with help of https://github.com/alvarolizama/phoenix-boilerplate bootstrap boilerplate

## Requirements

- Docker
- Docker Compose
- Cmake

## Run the project for development


### API endpoints examples

```shell
$ localhost:8000/api/leagues

$ localhost:8000/api/matches

$ localhost:8000/api/matches?season=201617

$ localhost:8000/api/matches?div=SP2

$ localhost:8000/api/matches?season=201516&div=SP1
```

### Environment

- Just run the next command for build the environment

```shell
make install_deps
```

- Test the installation running the service and open **http://localhost**

```shell
docker-compose up web
```

## Commands

### Docker commands

- make start: Start applications services
- make restart.phx: Restart web service
- make stop.phx: Stop web service
- make logs.phx: Show logs for web service
- make shell.phx: Open a shell in web service container

### Development commands

- make test: Run tests
- make test.shell: Open a shell for testing
- make credo: Run credo
- make coverage: Run coverage reports
- make routes: Show routes
- make deps.update: Clean and update dependencies
