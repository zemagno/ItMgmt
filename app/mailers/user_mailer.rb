class UserMailer < ActionMailer::Base
  
    default :from => "zemagno@gmail.com"

    def email_alerta(user,subject,task)
      @ci = task
      mail(:to => user,
           :subject => subject)
    end
end
