# ZSSN (Zombie Survival Social Network)

ZSSN Is a system created to help the human to survive an apocalypse zombie. Using only REST API requests, survivors can share resources with others non-infected humans.

## Table of Contents

* [Installation](#installation)
* [API Documentation](#api-documentation)
  * [List Survivors](#list-survivors)
  * [Add Survivors](#add-survivors)
  * [Update Survivor Location](#update-survivor-location)
  * [Flag Survivor as Infected](#flag-survivor-as-infected)
  * [Trade Resources](#trade-resources)
* [Reports](#reports)
  * [Percentage of infected survivors](#percentage-of-infected-survivors)
  * [Percentage of non-infected survivors](#percentage-of-non-infected-survivors)
  * [Average Resources By Survivor](#average-resources-by-survivor)
  * [Points lost because of infected survivors](#points-lost-because-of-infected-survivors)
* [Testing with RSpec](#testing-with-rspec)
* [Credits](#credits)

## Installation

**Dependention note**: Before installation make sure to have PostgreSQL (10.4) and Ruby (2.4) installed and up. 

1. Clone the project.

	~~~ sh
	$ https://github.com/ferdinando25/zssn
	~~~

2. Bundle the Gems.

	~~~ sh
	$ bundle install
	~~~

3. Set the database to postgre in the config file `config/database.yml`, add the follow code.
	 ~~~ sh
	default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: usuario_do_seu_banco
  password: senha_do_seu_banco
  timeout: 5000
  development:
  <<: *default
  database: survivors
  test:
  <<: *default
  database: survivors
  production:
  <<: *default
  database: survivors
  ~~~

4. Start the application

	~~~ sh
	$ rails s
	~~~

Application will be runing at [localhost:3000](http://localhost:3000).

## API Documentation

### List Survivors

##### Request 

```sh
GET  /api/v1/survivors`
```

##### Response

```sh
status: 200 Ok
```

```sh
Content-Type: "application/json"
```

```sh
Body:
[
    "status": "SUCCESSO",
    "message": "Sobreviventes",
    "data": [
        {
            "id": 5,
            "name": "Nathalia",
            "age": 17,
            "gender": "Feminino",
            "ll_latitude": 47.853,
            "ll_longitude": 22.232,
            "infested": "Nao",
            "reports": 0,
            "qt_water": 5,
            "qt_food": 4,
            "qt_medication": 3,
            "qt_ammunition": 2,
            "created_at": "2018-07-20T01:25:09.597Z",
            "updated_at": "2018-07-20T01:25:09.597Z"
        },
        {
            "id": 4,
            "name": "Giovanni",
            "age": 17,
            "gender": "Masculino",
            "ll_latitude": 43.232,
            "ll_longitude": 19.233,
            "infested": "Nao",
            "reports": 0,
            "qt_water": 5,
            "qt_food": 4,
            "qt_medication": 1,
            "qt_ammunition": 2,
            "created_at": "2018-07-20T01:24:41.784Z",
            "updated_at": "2018-07-20T01:24:41.784Z"
        },
        {
            "id": 3,
            "name": "Nicolle",
            "age": 15,
            "gender": "Feminino",
            "ll_latitude": 44.232,
            "ll_longitude": 12.232,
            "infested": "Nao",
            "reports": 0,
            "qt_water": 4,
            "qt_food": 1,
            "qt_medication": 2,
            "qt_ammunition": 3,
            "created_at": "2018-07-20T01:19:39.359Z",
            "updated_at": "2018-07-20T01:19:39.359Z"
        },
        {
            "id": 2,
            "name": "Bruno",
            "age": 17,
            "gender": "Masculino",
            "ll_latitude": 44.523,
            "ll_longitude": 12.233,
            "infested": "Nao",
            "reports": 0,
            "qt_water": 3,
            "qt_food": 0,
            "qt_medication": 2,
            "qt_ammunition": 3,
            "created_at": "2018-07-20T01:18:42.234Z",
            "updated_at": "2018-07-20T01:18:42.234Z"
        },
        {
            "id": 1,
            "name": "Fernando",
            "age": 22,
            "gender": "Masculino",
            "ll_latitude": 43.323,
            "ll_longitude": 18.323,
            "infested": "Nao",
            "reports": 0,
            "qt_water": 1,
            "qt_food": 2,
            "qt_medication": 0,
            "qt_ammunition": 1,
            "created_at": "2018-07-20T01:17:32.590Z",
            "updated_at": "2018-07-20T01:17:32.590Z"
        }
]
```

### Add Survivors

##### Request 

```sh
POST  /api/v1/survivors`
```

```sh
Parameters:
{
    {
     "name": "Vitor",
     "age": 18,
     "gender": "Masculino",
     "ll_latitude": 45.234,
     "ll_longitude": 25.423,
     "infested": "Nao",
     "reports": 0,
     "qt_water": 2,
     "qt_food": 3,
     "qt_medication": 2,
     "qt_ammunition": 1
    }
}
```

##### Response

```sh
status: 200 OK
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
  {
    "status": "SUCCESSO",
    "message": "Sobrevivente salvo",
    "data": {
        "id": 6,
        "name": "Vitor",
        "age": 18,
        "gender": "Masculino",
        "ll_latitude": 45.234,
        "ll_longitude": 25.423,
        "infested": "Nao",
        "reports": 0,
        "qt_water": 2,
        "qt_food": 3,
        "qt_medication": 2,
        "qt_ammunition": 1,
        "created_at": "2018-07-20T01:30:30.989Z",
        "updated_at": "2018-07-20T01:30:30.989Z"
    }
}
```

##### Errors
Status | Error                | Message
------ | ---------------------|--------
422    | Unprocessable Entity | Sobrevivente nao salvo. Todos os parametros devem ser preenchidos.

### Update Survivor Location

##### Request 

```sh
PATCH/PUT /api/v1/survivors/:id
```

```sh
Parameters:
{
    {
     "ll_latitude": 43.233,
     "ll_longitude": 25.255
    }
}
```

##### Response

```sh
status: 200 OK
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
  {
    "status": "SUCCESSO",
    "message": "Coordenadas atualizadas",
    "data": {
        "id": 1,
        "ll_latitude": 43.233,
        "ll_longitude": 25.255,
        "name": "Fernando",
        "age": 22,
        "gender": "Masculino",
        "infested": "Nao",
        "reports": 0,
        "qt_water": 1,
        "qt_food": 2,
        "qt_medication": 0,
        "qt_ammunition": 1,
        "created_at": "2018-07-20T01:17:32.590Z",
        "updated_at": "2018-07-20T01:35:10.712Z"
    }
}
```

##### Errors
Status | Error      |
------ | -----------|
404    | Not Found  |

### Flag Survivor as Infected

##### Request 

```sh
GET   https://zssn-api-ruby.herokuapp.com/api/v1/survivors/1/report_infested_survivor
```

##### Response

```sh
status: 200 ok
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
    "status": "SUCCESSO",
    "message": "Infestação reportada",
    "data": {
        "reports": 2,
        "id": 1,
        "name": "Fernando",
        "age": 22,
        "gender": "Masculino",
        "ll_latitude": 43.233,
        "ll_longitude": 25.255,
        "infested": "Nao",
        "qt_water": 1,
        "qt_food": 2,
        "qt_medication": 0,
        "qt_ammunition": 1,
        "created_at": "2018-07-20T01:17:32.590Z",
        "updated_at": "2018-07-20T01:35:10.712Z"
    }
}
```

##### Errors
Status | Error      |
------ | -----------|
404    | Not Found  |


### Trade Resources

Survivors can trade items among themselves, respecting a price table.

##### Request 

```sh
POST   /api/v1/trade/:survivor_1_id/with/:survivor_2_id
```

```sh
Parameters:
{
  {
  "offered": {
      "qt_water":[integer],
      "qt_food":[integer],
      "qt_medication":[integer],
      "qt_ammunition":[integer]
  },
  "wanted": {
    "qt_water":[integer],
    "qt_food":[integer],
    "qt_medication":[integer],
    "qt_ammunition":[integer]
  }
}
```

##### Response

```sh
status: 200 ok
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
    {
      "status": "SUCCESSO",
      "message": "Troca feita",
      "data": "Troca sucedida!"
    }
}
```

##### Errors
Status | Error                | Message
------ | ---------------------|--------
404    | Not Found            | 
409    | Conflict             | Existem sobreviventes infectados.
409    | Conflict             | Sobrevivente nao possui esses itens.
409    | Conflict             | Existe uma diferenca de pontos entre os trocadores.


## Reports

### Percentage of infected survivors

##### Request 

```sh
GET   /api/v1/percentage_infested_survivors
```

##### Response

```sh
status: 200 ok
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
    {
      "status": "SUCCESS",
      "message": "Porcentagem de Sobreviventes nao infestados",
      "data": "x%"
    }
}
```

### Percentage of non-infected survivors

##### Request 

```sh
GET   /api/v1/percentage_uninfested_survivors
```

##### Response

```sh
status: 200 ok
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
    {
      "status": "SUCCESS",
      "message": "Porcentagem de Sobreviventes infestados",
      "data": "100.0%"
    }
}
```

### Average Resources By Survivor

##### Request 

```sh
GET   /api/v1/average_resources_by_survivor
```

##### Response

```sh
status: 200 ok
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
    "status": "SUCCESS",
    "message": "Media de recursos por sobrevivente",
    "data": "Existem x sobrevivente(s) não infectado(s),e a media de itens por cada um eh a seguinte: agua - x, alimentos - x, medicamentos - x, municao - x"
}
```

### Points lost because of infected survivors

##### Request 

```sh
GET   /api/v1/points_lost
```

##### Response

```sh
status: 200 ok
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
    "status": "SUCCESS",
    "message": "Pontos perdidos",
    "data": "A quantidade de pontos atualmente eh de x"
}
```

## Testing with RSpec

The project was build with TDD (Test Driven Development). To execute the tests just run the tests with RSpec.

1. Execute all tests

    ~~~ sh
    $ bundle exec rspec
    ~~~

To see the test cover percent open the file `coverage/index.html` at your browser.