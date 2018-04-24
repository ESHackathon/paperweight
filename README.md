# Ris Parser

A Rails 5.2 interface with postgres to take in a RIS file, parse it into publications, and expose the db as an API

## Getting started

```
bundle install
yarn install
rails db:create db:migrate
rails server
```

## Data Science

Parsing the keywords and data science stuff is done in Python, run the flask app (from https://github.com/ESHackathon/keywords_extract) and place the local address in the `flask.rb` file

`FLASK_APP_ADDRESS="http://127.0.0.1:5000/keyword-extraction"`

## API Endpoints

*POST* `/searches` - Create a new search, responds with the parsed RIS file
*GET* `/searches/:id.json` - A JSON response on an uploaded RIS file...

