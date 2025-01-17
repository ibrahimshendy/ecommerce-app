### Installation

- copy .env.development.example
```
$ cp .env.development.example .env.development
```

-  copy docker-compose.yml.example
```
$ cp docker-compose.yml.example docker-compose.yml
```

- Start building docker
```
$ docker compose build
```

- Run migration
```
$ docker compose run app rails db:migrate
```

- Build assets
```
$ docker compose run app rails assets:precompile
```

- Launch app
```
$ docker-compose up app
```

- Open app on browser with url `http://0.0.0.0:3000/`