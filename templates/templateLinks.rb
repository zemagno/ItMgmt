load("templates/tmp/create_Fornecedor.rb")
load("templates/tmp/create_Link.rb")

tipoFornecedor = Tipoci.create({:tipo => "Fornecedor"})
forn1 = Ci.new(:chave => "Embratel",
			:Owner => "default",
			:notificacao => "default",
			:descricao => "Embratel",
			:site_id => 1,
			:tipoci_id => tipoFornecedor.id,
			:statusci_id => 1)
forn1.save!

forn2 = Ci.new(:chave => "VIVO",
			:Owner => "default",
			:notificacao => "default",
			:descricao => "VIVO",
			:site_id => 1,
			:tipoci_id => tipoFornecedor.id,
			:statusci_id => 1)
forn2.save!


tipoLink = Tipoci.create({:tipo => "Link"})
link1 = Ci.new(:chave => "Link_RJ_SP",
			:Owner => "default",
			:notificacao => "default",
			:descricao => "Link Escritorio Rio Branco --> Av Paulista",
			:site_id => 1,
			:tipoci_id => tipoLink.id,
			:statusci_id => 1)
link1._fornecedor = forn1.chave
link1.save!

# TODO - data vencimento / renovacao - campos obrigatorios

link2 = Ci.new(:chave => "Link_Cont_RJ_SP",
			:Owner => "default",
			:notificacao => "default",
			:descricao => "Link Contigencia Escritorio Rio Branco --> Av Paulista",
			:site_id => 1,
			:tipoci_id => tipoLink.id,
			:statusci_id => 1)
link2._fornecedor = forn2.chave
link2.save!

# TODO - gerar consultas, dashboards.

esse script ta com bug.
sequencia
db:reset
apagar tipocis
carregar esse script. 

TODO se o tipo ja existir, crio os dicdados ou nao ?



