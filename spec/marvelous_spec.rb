# marvelous_spec.rb

require 'marvelous'

describe Marvelous do

  keys = {}
  marvel = nil

  before :all do
    f = File.open './.env'
    f.each_line do |line|
      key, value  = line.split "="
      keys[key] = value
    end
    marvel = Marvelous.new(keys["PUBLIC_KEY"], keys["PRIVATE_KEY"])
  end

  it "should not be nil" do
    marvel.should_not be_nil
  end

  it "should not be nil" do
    characters = marvel.characters
    characters.should_not be_nil
  end

  it "character should not be nil" do
    id = 1009521
    character = marvel.characters(id)
    character.should_not be_nil
  end

  it "should not be nil" do
    comics = marvel.comics
    comics.should_not be_nil
  end

  it "should not be nil" do
    creators = marvel.creators
    creators.should_not be_nil
  end

  it "should not be nil" do
    events = marvel.events
    events.should_not be_nil
  end

  it "should not be nil" do
    series = marvel.series
    series.should_not be_nil
  end

  it "should not be nil" do
    stories = marvel.stories
    stories.should_not be_nil
  end
end
