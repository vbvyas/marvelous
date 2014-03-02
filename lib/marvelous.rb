require 'rest_client'

class marvelous
  @public_key, @private_key

  def initialize(public_key, private_key)
    @public_key = public_key
    @private_key = private_key
  end

  def characters
    uri = url(__callee__)
  end

  def comics
    uri = url(__callee__)
  end

  def creators
    uri = url(__callee__)
  end

  def events
    uri = url(__callee__)
  end

  def series
    uri = url(__callee__)
  end

  def stories
    uri = url(__callee__)
  end

  private

  def url(model)
    ts = Time.now.utc.to_i
    hash = Digest::MD5.digest(ts + @private_key + @public_key) 
    "http://gateway.marvel.com/v1/#{model}/?ts=#{ts}&apikey=#{@public_key}&hash=#{hash}"
  end
end
