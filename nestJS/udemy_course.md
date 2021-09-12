# NestJS Zero to Hero - Modern TypeScript Back-end Development

## To Start

Install nestjs
`$ yarn add global @nestjs/cli`

Create a project

`$ nest new <project name>`

## SCHEMATICS

#### Get a List of Available Schematichs

`nest g --help`

#### Generate a schematic without a spec file

to generate it without a spec use the following flag:
'--no-spec'
`$ nest g controller <controller name> --no-spec`

### Generate a Module

to generate a module we use
`$ nest g module <module name>`

'g' stands for 'generate'

In this case 'module' is the schematich.
if we just typed 'nest g' we would get an error telling us we are missing the schematich.

### Generate a Controller

to generate a controller type in the CLI:
`$ nest g controller <controller name>`

### Generate a Service

`$ nest g service tasks --no-spec`

## Pipes

### Install dependencies class-validator and class-transformer

[class-validator github page](https://github.com/typestack/class-validator)

`$ yarn add class-validator class-transformer`

## Setup Docker and Postgres

`$ docker run --name postgres-nest -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres`

#### notes about the above command:

- 'docker' to invoke docker
- 'run' to run a container
- '--name postgres-nest'. How I want to name my container. In this case 'postgres-nest'
- '-p 5432:5432' maps postgres port '5432' to our machine local port '5432'. Because I had another project using 5432, I had to use '6000:5432' instead.
- '-e POSTGRES_PASSWORD=postgres'. Sets environment variable password to postgres
- '-d' means it will run in detached mode. If the terminal is closed it will still continue running
- 'postgres' The actual container name that is store in docker hub.

### Start and stop the container

#### Start

`$ docker container start postgres-nest`

#### Stop

`$ docker container stop postgres-nest`

#### To delete it (Do only if you need to remove it)

`$ docker container rm postgres-nest`

## Install typeorm and PG driver

```$ yarn add typeorm @nestjs/typeorm pg`
