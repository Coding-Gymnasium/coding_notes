# Assignments

## Assignment 1

1. Spin up a Nodejs driven server (on port 3000, for example)
2. Handle two Routes: '/' and '/users'

   -  Return some greeting text on '/'
   -  Return a list of dummy users (e.g. `<ul><li>User</li></ul>`)

3. Add a form with a 'username' `<input>` to the '/' page and submit a POST request to '/create-user' upon a button click
4. Add the '/create-user' route and parse the incoming data (i.e. the username) and simply log it to the console.

### Notes

1. Create folder 'assignment-1' `mkdir assignment-1`
2. `cd assignment-1`
3. `vim app.js`
4. Import 'http' into 'app.js' `const http = require('http');`
5. Create function 'greeting':

   ```javascript
   const greeting = (req, res) => {
      res.setHeader('Content-Type', 'text/html');
      res.write('<html>');
      res.write('<body><h1>Hello World!</h1></body>');
      res.write('</html>');
      res.end();
   };
   ```

6. Create Server `const server = http.createServer(greeting);`
7. Listen to the server in port 3000 `server.listen(3000);`
8. On the terminal ran `node app.js` and visite `localhost:3000` in the browser to see the output.

#### Handle Routes

1. Create routes file and move greetings to it:

   ```javascript
   const greeting = (req, res) => {
      const url = req.url;
      if (url === '/') {
         res.setHeader('Content-Type', 'text/html');
         res.write('<html>');
         res.write('<body><h1>Hello World from Routes!</h1></body>');
         res.write('</html>');
         res.end();
      }
   };

   exports.greeting = greeting;
   ```

2. Refactor app.js and import routes function 'greeting':

   ```javascript
   const http = require('http');
   const routes = require('./routes');

   const server = http.createServer(routes.greeting);
   server.listen(3000);
   ```

3. Add users route:

```javascript
const app = (req, res) => {
   // --- some code omitted

   if (url === '/users') {
      res.setHeader('Content-Type', 'text/html');
      res.write('<html>');
      res.write('<body>');
      res.write('<h1>List of Users</h1>');
      res.write('<ul><li>Spongebob</li></ul>');
      res.write('<ul><li>Patrick</li></ul>');
      res.write('<ul><li>Sandy</li></ul>');
      res.write('<ul><li>Squidward</li></ul>');
      res.write('<ul><li>Mr. Krab</li></ul>');
      res.write('<ul><li>Plankton</li></ul>');
      res.write('</body>');
      res.write('</html>');
      res.end();
   }
};

exports.app = app;
```

#### Add a form with a 'username' `<input>`

1. Add form

```javascript
const app = (req, res) => {
  const url = req.url;
  const method = req.method;

  if (url === '/') {
    res.setHeader('Content-Type', 'text/html');
    res.write('<html>');
    res.write('<body>');
    res.write('<h1>Hello World from Routes!</h1>');
    res.write(
      '<label>Add User</label><form action="/create-user" method="POST"><input type="text" name="Create User"><button type="submit">Send</button></form>'
    );
    res.write('</body>');
    res.write('</html>');
    res.end();
  }
}
```
2. Add route
```javascript
if (url === '/create-user' && method === 'POST') {
  const body = [];

  req.on('data', (chunk) => {
    body.push(chunk);
    console.log(body);
  });

  return req.on('end', () => {
    const parsedBody = Buffer.concat(body).toString();
    const name = parsedBody.split('=')[1];
    console.log(name);
  });
}
```
