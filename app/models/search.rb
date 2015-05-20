require 'json'
require 'net/http'


class Search < ActiveRecord::Base

  def self.search(term)
    if term
      base_url = "https://itunes.apple.com/search?entity=movie&term="
      url = "#{base_url}#{term}"
      resp = Net::HTTP.get_response(URI.parse(url))
      data = resp.body
      result = JSON.parse(data)
    else
    end
  end
end
