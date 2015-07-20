module Dirble
  class PrimaryCategory < Category

    def self.all
      Dirble::Category.primary
    end

    def children
      self.class.call_api_with_results(
        request_type: :get,
        query: "category/#{id}/childs?token={{api_key}}",
        factory_klass: Dirble::Category
      )
    end

    def primary
      true
    end
  end
end
