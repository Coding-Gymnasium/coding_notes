# Typescript: the complete Developer's Guide

### Resources

[TS Converter](https://www.typescriptlang.org/)
[Course S. Grider's Finished Code](https://github.com/StephenGrider/typescriptcasts)

Using jsonplaceholder.typecode.com API

https://jsonplaceholder.typicode.com/todos/1

## Help

`$ tsc --help`

## Install

`$ npm install -g typescript ts-node`

If typescript is already install, install 'ts-node'

`$ npm install -g ts-node`

## Create project

`$ mkdir fetchjson && cd fetchjson`
`$ npm init -y`

### Install Axios

`$ npm install axios`

### Create Index.ts and Run Compiler

`$ touch index.ts`

```js
import axios from 'axios';

const url = 'https://jsonplaceholder.typicode.com/todos/1';

axios.get(url).then((response) => {
  console.log(response.data);
});
```

`$ tsc index.ts`

Typescript creates a 'index.js' version of our file.

Running `$ node index.js` prints `{ userId: 1, id: 1, title: 'delectus aut autem', completed: false }` to the terminal.

Running `$ ts-node index.ts` prints the same.

## Section 2

Definitions:

### Types

'Easy way to refer to the different properties + functions that a value has'

Types are used by the Typescript Compiler to analyze our code for errors.
Types allow other engineers to understand what values are flowing around our codebase

Value: Anything we can assign to a variable. For example strings, numbers, booleans, null, undefined, objects, functions, classes, arrays, etc. Any of these have a type. A class have a type, a number has a type, etc

For example: 'red' is a string. Which is a value that has all the properties + methods that we assume a string has.
In this case this case it means it includes properties and methods a 'string' has in JavaScript:

- charAt()
- charCodeAt()
- concat()
- includes()
- endWith()
- indexOf()
- lastIndexOf()
- localeCompare()
- match()
- etc

Types are shortcuts and labels for describing the different properties and methods a single value has. Every value in typescript has a type.

![types examples](./assets/types-examples.png)

#### Different Kinds of Types

##### Primitive Types

- number
- boolean
- void
- undefined
- string
- symbol
- null

##### Object Types

- functions
- arrays
- classes
- objects

![types kinds](./assets/types-kinds.png)

With object types we can write some code to 'trick' TypeScript to think the value it is a certain type. We can only do this with object types but not with primitive types.

## Type Annotations and type Inference

### Type Annotations

Code we add to tell Typescript what type of value a variable will refer to
The developer tell TypeScript the type

### Type Inference

Typescript tries to figure out what type of value a variable refers to
TypeScript guesses the type
If we do the initialization in the same line TS can figure out the type for us
However, if the initialization happens in another line we would get type 'any'

```ts
let apples; // type any
apples = 5;
```

![types inference](./assets/types-inference.png)

#### When To Use Each

#### Type Annotation

- When we declare a variable on one line then initialize it later
- When we want a variable to have a type that can't be inferred
- When a function returns the 'any' type and we need to clarify the value

##### Type Inference

- Always

![When To Use](./assets/when.png)

## The Any Type

When TS doesn't know what type to expect assigns the 'any' type.

The 'any' type is a regular type just like 'string' or 'boolean' are. It means TS has no idea what this is - can't check for correct property references.

<!-- prettier-ignore -->
**AVOID VARIABLES WITH 'ANY' AT ALL COST**

![JSON.parse() and TS](./assets/any.png)

## Type For Functions

### Type Annotations for Functions

Code we add to tell TS what type of arguments a function will receive and what type of values it will return.

### Type Inference for Functions

TS tries to figure out what type of value a function will return but not what type of value the arguments are.

Typescript makes sure we are returning the correct type of value but it doesn't check the logic in the function.

```ts
const add = (a: number, b: number): number => {
  return a - b; // TS won't catch the logic and notice that we have a '-' instead of a '+'
};
```

Always annotate the arguments type in a function. **No type inference for arguments**
TS inference will sort out the return type, however, it's not advisable to use it. Annotate the type for the return too.
