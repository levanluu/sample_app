class PasswordResetsController < ApplicationController
  before_action :get_user, :check_expiration, :valid_user, only: %i(edit update)

  def new; end

  def create
    if @user = User.find_by email: params[:password_reset][:email].downcase
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t("reset.email_sent")
      redirect_to root_url
    else
      flash.now[:danger] = t("reset.email_address")
      render :new
    end
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, t("reset.can_be")
      render :edit
    elsif @user.update(user_params)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = t("reset.password_has_been_reset")
      redirect_to @user
    else
      render :edit
    end
  end

  def edit; end

  private

  def get_user
    @user = User.find_by email: params[:email]
    return if @user
    flash[:success] = t("reset.email_address")
    redirect_to signup_path
  end

  def valid_user
    return if (@user.activated? && @user.authenticated?(:reset, params[:id]))
    flash[:danger] = t("reset.home_has_been_reset")
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def check_expiration
    if @user.password_reset_expired?

    flash[:danger] = t("reset.password_reset_expired")
    redirect_to new_password_reset_url
    end
  end

end
