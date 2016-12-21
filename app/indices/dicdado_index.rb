ThinkingSphinx::Index.define :dicdado, :with => :real_time do
    indexes nome, :as => :campo , :type => :string
    indexes apelido , :type => :string
    indexes valores , :type => :string
    indexes tipoci_id, :type => :integer
    indexes nice_tipoci , :as => :tipo, :type => :strings
    has tipoci_id, 	:type => :integer, :as => :sort_tipoci_id
    has ordem, 	:type => :integer, :as => :sort_ordem
end

# https://github.com/pat/thinking-sphinx/issues/583