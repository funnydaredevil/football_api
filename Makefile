##################################################################
#### Bootstrap Commands
##################################################################

install_deps:
	docker-compose run --rm --no-deps phx sh -c "\
		mix deps.get \
		&& mix deps.compile"
	docker-compose run --rm --no-deps --workdir "/app/src/assets" phx sh -c "\
		npm install"

##################################################################
#### Docker Commands
##################################################################

start:
	docker-compose up -d phx

restart:
	docker-compose restart phx

stop:
	docker-compose stop phx

logs:
	docker-compose logs -f phx

shell:
	docker-compose run --rm phx sh

##################################################################
#### Development Commands
##################################################################

test:
	ENV=test docker-compose run --rm phx sh -c "mix test"

test.shell:
	ENV=test docker-compose run --rm phx sh

credo:
	ENV=test docker-compose run --rm --no-deps phx sh -c "mix credo -a"

coverage:
	ENV=test docker-compose run --rm phx sh -c "mix coveralls.html"

routes:
	docker-compose run --rm --no-deps  phx sh -c "mix phx.routes"

deps.update:
	docker-compose run --rm --no-deps phx sh -c "\
		mix deps.clean --unused \
		&& mix deps.get \
		&& mix deps.compile"

npm.install:
	docker-compose run --rm --no-deps --workdir "/app/src/assets" phx sh -c "npm install"


##################################################################
#### Release Commands
##################################################################

check.all:
	ENV=test docker-compose run --rm phx sh -c "sh /scripts/run-checks.sh"

build.release:
	rm -rf ./src/_build/prod/rel
	ENV=prod docker-compose run --rm --no-deps --workdir "/app/src/assets" phx sh -c "\
		npm install \
		&& npx brunch build --production"
	ENV=prod docker-compose run --rm --no-deps phx sh -c "\
		mix deps.get \
		&& mix deps.compile \
		&& mix phx.digest \
		&& mix release --no-tar --env=prod"

start.prod:
	ENV=prod docker-compose run --rm --no-deps phx sh -c "\
		_build/prod/rel/release/bin/release foreground"