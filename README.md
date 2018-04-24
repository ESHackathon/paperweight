# Ris Parser

A Rails 5.2 interface with postgres to take in a RIS file, parse it into publications, and expose the db as an API

## Getting started

```
bundle install
yarn install
rails db:create db:migrate
rails server
```

Upload a RIS file, and go to `/searches/1.json` to see the parsed json
