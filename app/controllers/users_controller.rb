class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create show)
  before_action :load_user, except: %i(new index create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def show; end

  def edit; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "email.messages"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = t "update.messages"
      redirect_to @user
    else
      render :edit
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: Settings.user.page)
  end

  def destroy
    if @user.destroy
      flash[:success] = t "destroy.messages"
    else
      flash[:success] = t "destroy.messages3"
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "login_in.messages"
    redirect_to login_url
  end

  def correct_user
    redirect_to(root_url) unless @user == current_user
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = t ".errors"
    redirect_to root_path
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
