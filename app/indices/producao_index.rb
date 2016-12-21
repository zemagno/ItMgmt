ThinkingSphinx::Index.define :producao, :with => :real_time do
    indexes detalhe, :type => :string
    indexes status, :type => :string
    indexes job, :type => :string
    indexes id, :as => :jobid, :type => :integer
    indexes data, :type => :datetime
  end