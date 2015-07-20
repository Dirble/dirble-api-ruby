module Dirble
  class Category
    extend Dirble::SimpleApiModel

    attr_accessor :id, :name, :description

    def initialize(options)
      self.id = options[:id]
      self.name = options[:name]
      self.description = options[:description]
    end

    def self.all
      call_api_with_results(
        request_type: :get,
        query: 'categories/?token={{api_key}}'
      )
    end

    def self.find(category_id)
      all.select { |category| category.id == category_id }.first
    end

    def self.first
      all.first
    end

    def self.primary
      call_api_with_results(
        request_type: :get,
        query: 'categories/primary?token={{api_key}}',
        factory_klass: Dirble::PrimaryCategory
      )
    end

    def stations
      self.class.call_api_with_results(
        request_type: :get,
        query: "category/#{id}/stations?token={{api_key}}",
        factory_klass: Dirble::Station
      )
    end

    def primary
      false
    end
  end
end
