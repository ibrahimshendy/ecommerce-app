class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.filter(params)
  end
end
