class Checklist < ActiveRecord::Base
	belongs_to :evento
	has_many :itens_checklists

	#accepts_nested_attributes_for :itens_checklists, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
