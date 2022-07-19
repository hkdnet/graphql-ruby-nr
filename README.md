# README

## Result

| query \ NewRelicTracing | Disabled | Enabled 
| :---------------------- | -------: | ------: 
| firstUser               |    979ms |  1069ms 
| withLoader              |    403ms | 626ms 

NOTE: 2022-07-19 today, my machine shows a different result than https://github.com/hkdnet/graphql-ruby-nr/commit/ccefc10dcae5a1ed90eaba4cc6f8ea3bcb6e38a4 . Not sure why, but at least I can see the improvement.

The time values are picked up from Rails's output. For example, 456ms in this case.

```
Completed 200 OK in 456ms (Views: 12.1ms | ActiveRecord: 28.8ms | Allocations: 267658)
```

## Setup

```
$ bundle install
$ bin/rails db:create db:migrate db:seed # seed takes some time
$ bin/rails s
```

Go to `/graphiql` and run the queries.

By default, NewRelicTracing is disabled. You can eanbled it by setting `NEWRELIC=enabled` environment variable.

```
$ NEWRELIC=enabled bin/rails s
```

## Queries

```graphql
{
  firstUser {
    name
    posts {
      title
      body
      comments {
        body
        createdBy {
          name
        }
      }
    }
  }
}~
```

```graphql
{
  withLoader {
    name
    posts {
      title
      body
      comments {
        body
        createdBy {
          name
        }
      }
    }
  }
}~
```
