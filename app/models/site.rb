# Encoding: utf-8
class Site < ActiveRecord::Base

  attr_accessible :nome, :estado

  default_scope { order('nome ASC') }

  validates :nome, :presence => {:message => I18n.t("errors.site.presence") }
  validates :nome, :uniqueness => {:case_sensitive => false, :message => I18n.t("errors.site.uniqueness") }

  has_many :ci #, :dependent => :restrict_with_exception

end
