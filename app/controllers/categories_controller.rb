class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      flash[:success] = 'Category Create Successful'
      redirect_to categories_path
    else
      flash[:danger] = 'OP!!! Seem Somethings Went Wrong'
      render new_category_path
    end

  end

  def show
    @category = Category.find(params[:id])
    @articles_by_category = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  private

  def category_param
    params.require(:category).permit(:name)

  end

  public def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = 'You are not admin!!!'
      redirect_to categories_path
    end
  end
end
