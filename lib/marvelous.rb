require 'rest_client'
require 'json'

class marvelous
  @public_key, @private_key

  def initialize(public_key, private_key)
    @public_key = public_key
    @private_key = private_key
  end

  def characters
    get_response(__callee__)
  end

  def comics
    get_response(__callee__)
  end

  def creators
    get_response(__callee__)
  end

  def events
    get_response(__callee__)
  end

  def series
    get_response(__callee__)
  end

  def stories
    get_response(__callee__)
  end

  private

  def get_response(callee)
    uri = url(callee)
    response = RestClient.get uri
    JSON.parse(response)
  end

  def url(model)
    ts = Time.now.utc.to_i
    hash = Digest::MD5.digest(ts + @private_key + @public_key) 
    "http://gateway.marvel.com/v1/#{model}/?ts=#{ts}&apikey=#{@public_key}&hash=#{hash}"
  end
end
