# Modern Full-Stack Development with Nest.js, React, TypeScript, and MongoDB

![Part 1](https://auth0.com/blog/modern-full-stack-development-with-nestjs-react-typescript-and-mongodb-part-1/#Conclusion)
![Part 2](https://auth0.com/blog/modern-full-stack-development-with-nestjs-react-typescript-and-mongodb-part-2/)
![Author's Repo](https://github.com/auth0-blog/nest-react-blog-ga)

<hr/>

## Backend

`$ nest new blog-backend`

When prompted select 'yarn' and hit 'Return'

Install Mongoose to integrate with MongoDB

`$ cd blog-backend && yarn add @nestjs/mongoose mongoose`

Edit the port in main.ts

```javascript
// /blog-backend/src/main.ts

import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(5000); // edit this
}
bootstrap();
```

Run the BE
`$ yarn run start:dev`

### Configuring a Database Connection


