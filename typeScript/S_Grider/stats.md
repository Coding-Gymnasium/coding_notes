# Stats Project

`$ mkdir stats && cd stats`

`$ yarn init -y` or `npm init -y`

`$ tsc --init`

`$ yarn add nodemon concurrently`

`$ mkdir src build`

Change tsconfig.json

uncomment and change 'outDir' and 'rootDir'

```
"outDir": "./build"
"rootDir": "./src"
```

Add Scripts to package.json

```
"scripts": {
  "start:build": "tsc -w",
  "start:run": "nodemon build/index.js",
  "start": "concurrently yarn:start:*"
},
```

test by running

`$ yarn start`

if there is an error do 'ctrl + c' then run again.

CSV File

Add csv file 'football.csv' to the root directory.
Note: There is a copy available in the assets folder.

In the terminal install node type definition file

`$ yarn add @types/node`

Create index.ts

`$ touch src/index.ts`

Inside it import fs and parse the csv file.

```javascript
import fs from 'fs';

const matches = fs
  .readFileSync('football.csv', {
    encoding: 'utf8',
  })
  .split('\n')
  .map((row: string): string[] => {
    return row.split(',');
  });
```

if we console.log matches we should see something like this:

```
[
  [
    '10/08/2018',
    'Man United',
    'Leicester',
    '2',
    '1',
    'H',
    'A Marriner'
  ],
  [ '11/08/2018', 'Bournemouth', 'Cardiff', '2', '0', 'H', 'K Friend' ],
  [ '11/08/2018', 'Fulham', 'Crystal Palace', '0', '2', 'A', 'M Dean' ],
  ...
]
```

## Enums

- Follow near-identical sytax rules as normal objects.
- Creates an object with the same keys and values when converted from TS to JS
- Primary goal is to signal to other engineers that these are all closely related values.
- Use whenever we have a small fixed set of values that are all closely related and known at compile time.

## Parsing a Date String to a Date Object

`new Date()`

it can take multiple arguments

new Date(<year>, <month as index>, <date>)

`new Date(2021, 0, 28)`
returns => Thu Jan 28 2021 00:00:00 GMT-0700 (Mountain Standard Time) {}

In the project we create a new file called 'utils.ts' and a parsing method, 'dateStringToDate'
The reason we do this in a separate file is to abstract it from index.ts since it has nothing to do with its main function.

```javascript
export const dateStringToDate = (dateString: string): Date => {
  const dateParts = dateString.split('/').map((value: string): number => {
    return parseInt(value);
  });

  return new Date(dateParts[2], dateParts[1], dateParts[0]);
};
```
