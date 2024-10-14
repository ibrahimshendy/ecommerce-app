class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = Category.filter(params)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'Category was successfully created.'
      redirect_to admin_category_path(@category.id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if(@category.update(category_params))
      flash[:success] = 'Category was successfully updated.'
      redirect_to edit_admin_category_path(@category)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :slug, :description, :status)
  end
end
