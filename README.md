# marvelous

Ruby Gem for the Marvel API:

[developer.marvel.com/docs](http://developer.marvel.com/docs)

### Usage

Get the public and private API keys from here: [developer.marvel.com/account](https://developer.marvel.com/account)

    require 'marvelous'
    marvel = Marvelous.new(public_key, private_key)

Characters:

    /v1/public/characters
    /v1/public/characters/{characterId}
    /v1/public/characters/{characterId}/comics
    /v1/public/characters/{characterId}/events
    /v1/public/characters/{characterId}/series
    /v1/public/characters/{characterId}/stories

    characters = marvel.characters # get all characters
    character = marvel.characters(characterId)

Get other linked objects of a character

    character = marvel.characters(characterId)
    comics = marvel.characters(characterId, :comics)
    events = marvel.characters(characterId, :events)
    series = marvel.characters(characterId, :series)
    stories = marvel.characters(characterId, :stories)

Comics:

    /v1/public/comics
    /v1/public/comics/{comicId}
    /v1/public/comics/{comicId}/characters
    /v1/public/comics/{comicId}/creators
    /v1/public/comics/{comicId}/events
    /v1/public/comics/{comicId}/stories

    comics = marvel.comics # get all comics
    comic = marvel.comics(comicId)

Get other linked objects of a character

    comic = marvel.comics(comicId)
    characters = marvel.comics(comicId, :characters)
    creators = marvel.comics(comicId, :creators)
    events = marvel.comics(comicId, :events)
    stories = marvel.comics(comicId, :stories)

All the other objects work the same way.
