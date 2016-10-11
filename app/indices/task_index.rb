ThinkingSphinx::Index.define :task, :with => :active_record do
      indexes nome
      indexes description
      indexes chamado
      indexes tipotask
      indexes ci(:chave), :as => :CI
      indexes ci_id
      indexes :Ativo
  end