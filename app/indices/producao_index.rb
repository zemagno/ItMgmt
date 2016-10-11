ThinkingSphinx::Index.define :producao, :with => :active_record do

    indexes detalhe
    indexes status
    indexes job
    indexes id
    indexes data
  end