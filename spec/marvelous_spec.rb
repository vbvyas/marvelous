# marvelous_spec.rb

require 'marvelous'

describe Marvelous do

  before :all do
    File.read './.env' do |line|
      key, value  = line.split "="
      ENV[key] = value
    end
  end

  it "should not be nil" do
    marvel = Marvelous.new(ENV["PUBLIC_KEY"], ENV["PRIVATE_KEY"])
    marvel.should_not be_nil
    characters = marvel.characters
    characters.should_not be_nil
  end
end
