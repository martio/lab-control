# Lab Control

## Installation

#### Build the project

```
docker-compose build
```

#### Boot the app

```
docker-compose up -d
```

#### Create the database

```
docker-compose run web rake db:create
```

#### Run the test

```
docker-compose run web rake test
```