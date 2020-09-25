class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("reset.messages6")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("reset.messages8")
  end
end
