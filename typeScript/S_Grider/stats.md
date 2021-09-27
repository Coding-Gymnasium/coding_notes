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
