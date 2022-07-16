# README

## Result

| query \ NewRelic Tracer | Disabled | Enabled | multiplier |
| :---------------------- | -------: | ------: | ---------: |
| firstUser               |    456ms |  1246ms |     x 2.73 |
| withLoader              |    446ms | 33670ms |    x 75.49 |

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

Currently NewRelic is enabled.
To test with NewRelic disabled, please revert `03a2954fc0b6c3819b65cb370e6df567543094e9`.

```
$ git revert 03a2954fc0b6c3819b65cb370e6df567543094e9
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
