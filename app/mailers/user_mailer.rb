class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("reset.account_activated")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("reset.password_reset")
  end
end
