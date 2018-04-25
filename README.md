# Paperweight
## Broaden your horizons

Learn more about a scientific field. Paperweight allows you to simply paste in an RIS file of publications (exportable from Scopus), and find keywords and topic modelling analysis to help you discover more about the field.

## About the app

The app is in two parts, a Rails 5.2 interface with postgres database for the main app, and a Flask app with Python 3 and rake-ntlk for natural language processing

## 1. Rails App (Interface)

```
bundle install
yarn install
rails db:create db:migrate
rails s
```

## 2. Flask App (Data Science)

Parsing the keywords and data science stuff is done in Python, run the flask app (from https://github.com/ESHackathon/keywords_extract) and place the local address in the `flask.rb` file

`FLASK_APP_ADDRESS="http://127.0.0.1:5000/keyword-extraction"`

Fire up the flask app with...

```
export FLASK_APP=server.py
python server.py
```

## API Endpoints

You can create saved searches, parse a RIS file to json and retrieve historic parsed RIS files from the app with the following...
(remember to pass the RIS as a long string wrapped inside the search object)

### [POST] /searches.json
*Params:* {search: {ris: "TY  - Blah blah..." }
Create a new search, responds with the parsed RIS file

### [GET] /searches/:id.json
A JSON response on an uploaded RIS file...

## With thanks

to Stockholm Environment Institute for the Evidence Synthesis Hackathon that this was created at, Panos (https://github.com/eridanos) and Geoffrey Martin for the dope keyword extraction...

https://github.com/ESHackathon/keywords_extract

