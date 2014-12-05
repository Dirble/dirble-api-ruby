module Dirble
  class Station
    extend Dirble::SimpleApiModel

    attr_accessor :id, :name, :stream_url, :description, :website, :url_id,
      :song_history, :categories, :country, :bitrate

    def initialize(options)
      self.id = options[:id]
      self.name = options[:name]
      self.website = options[:website]
      self.country = options[:country]
      self.bitrate = options[:bitrate]
    end

    def self.search(keyword)
      call_api_with_results(
        request_type: :get,
        query: "search/apikey/{{api_key}}/search/#{keyword.parameterize}"
      )
    end

    def self.by_continent(name)
      call_api_with_results(
        request_type: :get,
        query: "continent/apikey/{{api_key}}/continent/#{name.parameterize}"
      )
    end
  end
end
