# Setting up prisma

1. `npm install prisma --save-dev`

2. `npx prisma init`: initialize prisma, this adds an env to your project and a schema.prisma file to the prisma file this is were your models will be and your prisma connection info.

3. `npx prisma migrate dev --name <migration_name>`: generate a prisma migration files and runs them againt the db.

4. `npm install @prisma/client`: install prisma client. This is a type-safe database client that's generated from your Prisma model definition. Because of this approach, Prisma Client can expose CRUD operations that are tailored specifically to your models.

#### NOTES

- You could use `npx prisma db push` before the first migration(before an existing migration history is created) to sync your pirsma schema to your database schema (be careful with this as it could lead to data loss because it doesn't create migrations)

- You can run `npx prisma db pull` to turn(sync) your database schema into a Prisma schema.

- Note that during installation, Prisma automatically invokes the `prisma generate` command for you. In the future, you need to run this command after every change to your Prisma models to update your generated Prisma Client.
