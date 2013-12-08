class CiMailer < ActionMailer::Base
  default from: "zemagno@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ci_mailer.revalidar_servidor.subject
  #
  def revalidar_servidor(ci,subject)
    @ci = ci

    mail to: "zecarlosmagno@gmail.com"
  end
end
