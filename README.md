# GarageLab Test

Small application to manage expense reporting.
Allows you to add, list, update and delete expenses as well as mark them as paid. Delivers the total due according to the amount of unpaid expenses.

## Install and run

- Install dependencies:

```bash
bundle install
```

- Migrate and seed the db:

```bash
rake db:migrate && rake db:seed
```

- Run the server:

```bash
rails s
```

## Testing

- Run testing suite:

```bash
rake spec
```
