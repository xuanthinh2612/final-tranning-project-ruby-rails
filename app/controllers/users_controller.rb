class UsersController < ApplicationController

  before_action :require_same_user, only: [:edit, :update]

  def index
    #phan trang
    @users = User.all.paginate(page: params[:page], per_page: 3)
    # @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "wellcome to the blog"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    require_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Update information successful'
      redirect_to articles_path
    else
      render 'edit'
    end
    # if
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'User and their article was successfully deleted'
    redirect_to users_path

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    @user = User.find(params[:id])
    if !logged_in? || current_user != @user
      flash[:danger] = 'your request was denied'
      redirect_to articles_path
    end
  end

end