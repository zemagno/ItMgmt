require 'rails_helper'


# class CiTest < ActiveSupport::TestCase
#   # test "the truth" do
#   #   assert true
#   # end
# end
# require 'spec_helper'

describe Ci do

  before :each do
    @ci = Ci.new
    @ci.chave = "TesteCI001"
    @ci.descricao = "TesteCI001"
    @ci.Owner = "magno"
    @ci.notificacao = "magno"
    @ci.tipoci_id = 8
    @ci.statusci_id = 1
  end
  describe "#new" do
    it "inicializado corretamente" do
         expect(@ci).to be_an_instance_of(Ci)
    end
    it "tem que ter chave valida" do
    	expect(@ci.valid?).to be(true)
    	expect(@ci.errors[:chave].length).to be(0)

    	@ci.chave = "m agno"
    	expect(@ci.valid?).to be(false)
    	expect(@ci.errors[:chave]).to include(I18n.t("errors.ci.chave.format"))

    	@ci.chave = nil
    	expect(@ci.valid?).to be(false)
     	expect(@ci.errors[:chave]).to include(I18n.t("errors.ci.chave.format"))
    	expect(@ci.errors[:chave]).to include(I18n.t("errors.ci.chave.presence"))
    	
    	@ci.chave = "srv361"
    	expect(@ci.valid?).to be(false)
    	expect(@ci.errors[:chave]).to include(I18n.t("errors.ci.chave.uniqueness"))
 
     	@ci.chave = "TesteCI002"
    	expect(@ci.valid?).to be(true)
    	expect(@ci.errors[:chave].length).to be(0)

    end

  end
end
