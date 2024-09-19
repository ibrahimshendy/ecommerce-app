module CategorySearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name    "categories-#{Rails.env}"
    self.settings File.open("config/elasticsearch/category.json")

    mappings do
      indexes :id, :type => 'integer'
      indexes :slug, :type => 'text', analyzer: 'trigram'
      indexes :name, :type => 'text', analyzer: 'trigram'
      indexes :description, :type => 'text', analyzer: 'trigram'
    end

    def as_indexed_json(options={})
      {
        :id => self.id,
        :name => self.name,
        :slug => self.slug,
        :description => self.description,
      }.as_json()
    end
  end
end
