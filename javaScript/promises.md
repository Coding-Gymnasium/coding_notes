# Promises

![Promises - MDN Web Docs]('https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise')

## Promise Constructor

We create a new promise using a promise constructor

```javascript
new Promise();
```

## Executor Function

The promise constructor takes exactly one argument that is called 'executor function'
As soon as the promise constructor runs, it will automatically execute the 'executor function'.
The executor function contains the asynchronous behavior and should eventually produce a result value. This value will be the future value of the promise.

### Resolve and Reject

As it executes it will pass two other arguments, 'resolve' and 'reject' functions.

```javascript
new Promise(function (resolve, reject) {
  // logic here
});
```

When the promise is fulfilled the 'resolve' function sets the fulfilled value fo the promise so later can be consumed by the '.then' method.

When the promise is not fulfilled we use the 'reject' function to pass in the error message to the '.catch' method.

```javascript
const lotteryPromise = new Promise(function (resolve, reject) {
  if (Math.random() >= 0.5) {
    resolve('You Win!💰');
  } else {
    reject('You lost 😢');
  }
});
```

## Then and Catch

To consume the promise value we use the method '.then'.
This method needs a callback function that is going to be called with the resolved value of the promise.
In the example below we call this 'res' but it can be called anything we like.

```javascript
lotteryPromise.then((res) => console.log(res));
```

In this case res will be the same as the string we passed into resolve: 'You Win!💰'

When the promise is not fulfilled we handle the errors using the '.catch' method.
In this example we called it 'err' but it can take any name we prefer.

```javascript
lotteryPromise
  .then((res) => console.log(res))
  .catch((err) => console.error(err));
```

In this case err will be the same as the string we passed into reject: 'You lost 😢'

### Asynchronous Behavior

The whole point of promises is to handle asynchronous behavior.

```javascript
const lotteryPromise = new Promise(function (resolve, reject) {
  console.log('awaiting results...');

  setTimeout(() => {
    if (Math.random() >= 0.5) {
      resolve('You Win!');
    } else {
      reject(new Error('You lost'));
    }
  }, 2000);
});

lotteryPromise
  .then((res) => console.log(res))
  .catch((err) => console.error(err));
```

## Promisifying

Usually we build promises to wrap callback asynchronous behavior based functions. This process is called promisifying. Promisifying is the convertion of these type of functions to promise based functions.

```javascript
const wait = (seconds) => {
  return new Promise((resolve) => {
    setTimeout(resolve, seconds * 1000);
  });
};

wait(2)
  .then(() => {
    console.log('I waited for 2 seconds');
    return wait(1);
  })
  .then(() => console.log('I waited for 1 second'));
```

### Using Geolocation API

```javascript
navigator.geolocation.getCurrentPosition(
  (position) => console.log(position),
  (err) => console.log(err)
);
```

Promisifying the above function:

```javascript
const getPosition = () => {
  return new Promise((resolve, reject) => {
    // navigator.geolocation.getCurrentPosition(
    //   position => resolve(position),
    //   err => reject(err)
    // );
    navigator.geolocation.getCurrentPosition(resolve, reject); // this line does the same as the commented lines above.
  });
};

getPosition().then((pos) => console.log(pos)); // GeolocationPosition {coords: GeolocationCoordinates, timestamp: 1632752163306}
getPosition().then((pos) => console.log(pos.coords)); // GeolocationCoordinates {latitude: 39.757683, longitude: -104.8908404, altitude: null, accuracy: 20.579, altitudeAccuracy: null, …}
```
