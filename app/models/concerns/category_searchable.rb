module CategorySearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name    "categories-#{Rails.env}"
    self.settings File.open("config/elasticsearch/category.json")

    mappings do
      indexes :id, :type => 'integer'
      indexes :slug, :type => 'keyword'
      indexes :name, :type => 'text', analyzer: 'trigram'
      indexes :description, :type => 'text', analyzer: 'trigram'
    end

    def as_indexed_json(options={})
      self.as_json( only: [:id, :name, :slug, :description] )
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
