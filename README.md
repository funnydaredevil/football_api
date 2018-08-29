# Football API project

API project to study and enjoy Elixir and Phoenix.
Developed with help of https://github.com/alvarolizama/phoenix-boilerplate bootstrap boilerplate

Logging: $ make logs
Metrics: Credo

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

$ localhost:8000/api/matches?page=12page_size=10

$ localhost:8000/api/matches?season=201516&div=SP1?page=3page_size=50
```

### Environment

- Just run the next commands to build the environment

```shell
make install_deps
docker-compose up
```

## Commands

### Docker commands

- make start: Start applications services
- make stop: Stop web service
- make logs: Show logs for web service
- make shell: Open a shell in web service container

### Development commands

- make test: Run tests
- make test.shell: Open a shell for testing
- make credo: Run credo
- make coverage: Run coverage reports
- make routes: Show routes
- make deps.update: Clean and update dependencies
