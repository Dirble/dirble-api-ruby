require 'iso_country_codes'

module Dirble
  class Station

    extend Dirble::SimpleApiModel

    attr_accessor :id, :name, :streams, :description, :website, :url_id,
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

      def similar(station_id)
        call_api_with_results(
          request_type: :get,
          query: "station/#{station_id}/similar?token={{api_key}}"
        )
      end

      def by_country_name(country_name)
        code = IsoCountryCodes.search_by_name(country_name).first.alpha2
        by_country(code)
      end

    end
  end
end
