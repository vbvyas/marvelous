require 'rest_client'
require 'json'
require 'ostruct'

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
    ts = timestamp
    hash = hash(ts)
    response = RestClient.get uri, { params: { apikey: @public_key, ts: ts, hash: hash } }
    OpenStruct.new(JSON.parse(response))
  end

  def url(model, id)
    if id.nil?
      "#{base_uri}/#{model}"
    else
      "#{base_uri}/#{model}/#{id}"
    end
  end

  def base_uri
    "http://gateway.marvel.com/v1/public"
  end

  def timestamp
    Time.now.to_i.to_s
  end

  def hash(ts)
    Digest::MD5.hexdigest(ts + @private_key + @public_key)
  end
end
