# React

A JavaScript library for building user interfaces.
React is not necessary to do this - like HTML, CSS, and JavaScript are - but makes building complex, interactive and reactive user interfaces simpler.

All user interfaces are made up of components, and React is all about components.
Components are reusable building blocks that made up the interface.
In React, components are a combination of HTML (structure), CSS (Styling), and JavaScript (behavior and logic).

## Components

### Why Components?

- Reusability
  - Don't repeat yourself
- Separation of Concerns
  - Don't do too many things in one and the same place (function)

Splitting big chunks of code into multiple smaller functions is a concept common to all of programming - not just React.
React makes this concept a foundational pillar of its philosophy.

### How is a Component Built?

- HTML
- CSS
- JavaScript

Eventhough CSS is important the main focus of React is in combining HTML with JavaScript.

Components are primarily a kind of JavasScript function.

React uses a declarative approach to build components.
React won't tell that a certain html should be created and inserted in a specific place on the user interface.
Instead, in React we define the desired end state.
We let React figure out the actual JavaScript DOM instructions.

At the end we build our own custom HTML components we can use anywhere in the app.

### Component Tree

We build a component tree in React, where the top component is what gets render to the page.

```
<App />
  - <Header />
  - <Tasks />
      - <Task />
      - <Task />
      - <Task />
```

### JSX

JSX stands for JavaScript XML

## Create an app with Create-React-App

`npx create-react-app <my app name>`

`cd <my app name>`

`yarn start`

note: this command wasn't working. I removed 'yarn.lock' `rm yarn.lock` and then ran `yarn install`.
After this steps the app started.
