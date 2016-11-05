class Mailing < ActiveRecord::Base
  belongs_to :templates_email
  attr_accessible :body, :cc, :subject, :tag, :to, :from, :templates_email_id
  default_scope { order('tag ASC') }

  def templates_email_nome 
    templates_email.nil? ? "" : templates_email.nome
 	
  end


  def self.campanhas
  	  self.all.map(&:tag).uniq
  end

  def self.erros(_parametros)
  	  erros = []
  	  erros << ["error","Campanha com tag nulo"] if Mailing.where(tag: _parametros[:tag], templates_email_id: nil).count >0
  	  erros << ["error","to: ou from: nulo"] if Mailing.where("`to` is null or `from` is null").count >0
  	  
  	  erros
  end


end
