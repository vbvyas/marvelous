# marvelous

Ruby Gem for the Marvel API:

[developer.marvel.com/docs](http://developer.marvel.com/docs)

### Usage
Coming soon

Get the public and private API keys from here: [developer.marvel.com/account](https://developer.marvel.com/account)

    require 'marvelous'
    marvel = new Marvelous(public_key, private_key)

Characters:
    /v1/public/characters
    /v1/public/characters/{characterId}
    /v1/public/characters/{characterId}/comics
    /v1/public/characters/{characterId}/events
    /v1/public/characters/{characterId}/series
    /v1/public/characters/{characterId}/stories

    characters = marvel.characters # get all characters
    character = marvel.characters(:id => characterId)

Get other linked objects of a character

    character = marvel.characters(:id => characterId)
    comics = character.comics
    events = character.events
    series = character.stories

Comics:
    /v1/public/comics
    /v1/public/comics/{comicId}
    /v1/public/comics/{comicId}/characters
    /v1/public/comics/{comicId}/creators
    /v1/public/comics/{comicId}/events
    /v1/public/comics/{comicId}/stories

    comics = marvel.comics # get all comics
    comic = marvel.comics(:id => comicId)

Get other linked objects of a character

    comic = marvel.comics(:id => comicId)
    characters = comic.characters
    creators = comic.creators
    events = comic.events
    stories = comic.stories

REST API from Marvel:
    /v1/public/creators
    /v1/public/creators/{creatorId}
    /v1/public/creators/{creatorId}/comics
    /v1/public/creators/{creatorId}/events
    /v1/public/creators/{creatorId}/series
    /v1/public/creators/{creatorId}/stories
    /v1/public/events
    /v1/public/events/{eventId}
    /v1/public/events/{eventId}/characters
    /v1/public/events/{eventId}/comics
    /v1/public/events/{eventId}/creators
    /v1/public/events/{eventId}/series
    /v1/public/events/{eventId}/stories
    /v1/public/series
    /v1/public/series/{seriesId}
    /v1/public/series/{seriesId}/characters
    /v1/public/series/{seriesId}/comics
    /v1/public/series/{seriesId}/creators
    /v1/public/series/{seriesId}/events
    /v1/public/series/{seriesId}/stories
    /v1/public/stories
    /v1/public/stories/{storyId}
    /v1/public/stories/{storyId}/characters
    /v1/public/stories/{storyId}/comics
    /v1/public/stories/{storyId}/creators
    /v1/public/stories/{storyId}/events
    /v1/public/stories/{storyId}/series
