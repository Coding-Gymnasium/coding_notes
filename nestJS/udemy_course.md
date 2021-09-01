# NestJS Zero to Hero - Modern TypeScript Back-end Development

## To Start

Install nestjs
`$ yarn add global @nestjs/cli`

Create a project

`$ nest new <project name>`

## Generate a Module

to generate a module we use
`$ nest g module <module name>`

'g' stands for 'generate'

In this case 'module' is the schematich.
if we just typed 'nest g' we would get an error telling us we are missing the schematich.

### Get a List of Available Schematichs

`nest g --help`

## Generate a Controller

to generate a controller type in the CLI:
`$ nest g controller <controller name>`

to generate it without a spec use the following flag:
'--no-spec'
`$ nest g controller <controller name> --no-spec`
