class Mailing < ActiveRecord::Base
  belongs_to :templates_email
  attr_accessible :body, :cc, :subject, :tag, :to, :templates_email_id

end
