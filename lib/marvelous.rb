require 'rest_client'
require 'json'

class Marvelous
  @public_key
  @private_key

  def initialize(public_key, private_key)
    @public_key = public_key.tr("\n", "")
    @private_key = private_key.tr("\n", "")
  end

  def characters(id = nil)
    get_response(__callee__, id: id)
  end

  def comics(id = nil)
    get_response(__callee__, id: id)
  end

  def creators(id = nil)
    get_response(__callee__, id: id)
  end

  def events(id = nil)
    get_response(__callee__, id: id)
  end

  def series(id = nil)
    get_response(__callee__, id: id)
  end

  def stories(id = nil)
    get_response(__callee__, id: id)
  end

  private

  def get_response(callee, options = {})
    uri = url(callee, options[:id])
    response = RestClient.get uri
    JSON.parse(response)
  end

  def url(model, id)
    if id.nil?
      "#{base_uri}/#{model}/#{api_query}"
    else
      "#{base_uri}/#{model}/#{id}/#{api_query}"
    end
  end

  def base_uri
    "http://gateway.marvel.com/v1"
  end

  def api_query
    ts = Time.now.utc.to_i.to_s
    hash = Digest::MD5.hexdigest(ts + @private_key + @public_key) 
    "?ts=#{ts}&apikey=#{@public_key}&hash=#{hash}"
  end
end
