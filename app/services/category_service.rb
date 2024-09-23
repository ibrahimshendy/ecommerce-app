# frozen_string_literal: true

class CategoryService

  # applying filter inside category model
  def self.api_filter(params)
    Category.filter(params)
  end

end
