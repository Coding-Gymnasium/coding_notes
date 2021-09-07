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
