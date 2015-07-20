require 'iso_country_codes'

module Dirble
  class Station
    REQUIRED_FIELDS = [:name, :website, :directory]

    extend Dirble::SimpleApiModel

    attr_accessor :id, :name, :stream_url, :description, :website, :url_id,
                  :categories, :country, :bitrate, :status
    attr_reader :song_history

    def initialize(options)
      self.id = options[:id]
      self.name = options[:name]
      self.website = options[:website]
      self.country = options[:country]
      self.bitrate = options[:bitrate]
      self.status = options[:status]
    end

    private

    def song_history=(list_of_songs)
      @song_history ||= Dirble::Song.factory(list_of_songs)
    end

    class << self
      def find(station_id)
        call_api_with_results(
          request_type: :get,
          query: "station/#{station_id}?token={{api_key}}"
        ).first
      end

      def search(keyword)
        call_api_with_results(
          request_type: :get,
          query: "search/#{keyword.parameterize}?token={{api_key}}"
        )
      end

      def by_country(code)
        call_api_with_results(
          request_type: :get,
          query: "countries/#{code}/stations?token={{api_key}}"
        )
      end

      def song_history(station_id)
        call_api_with_results(
          request_type: :get,
          query: "station/#{station_id}/song_history?token={{api_key}}"
        )
      end

      def by_country_name(country_name)
        code = IsoCountryCodes.search_by_name(country_name).first.alpha2
        by_country(code)
      end

    end
  end
end
