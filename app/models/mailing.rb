class Mailing < ActiveRecord::Base
  belongs_to :templates_email
  attr_accessible :body, :cc, :subject, :tag, :to, :from, :templates_email_id
  default_scope order('tag ASC')
end
