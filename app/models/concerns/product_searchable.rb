# frozen_string_literal: true
module ProductSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name    "products-#{Rails.env}"
    self.settings File.open("config/elasticsearch/product.json")

    mappings do
      indexes :id, :type => 'integer'
      indexes :name, :type => 'text', analyzer: 'arabic_english'
      indexes :description, :type => 'text', analyzer: 'arabic_english'
    end

    def as_indexed_json(options={})
      self.as_json( only: [:id, :name, :description] )
    end

    def self.search(query)
      self.__elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: query,
              fields: %w[name^5 description]
            }
          },
          # more blocks will go IN HERE. Keep reading!
        }
      ).records.to_a
    end
  end
end
