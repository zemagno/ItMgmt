require 'rails_helper'

RSpec.describe "checklist_items/new", type: :view do
  before(:each) do
    assign(:checklist_item, ChecklistItem.new(
      :checklist_id => 1,
      :nome => "MyString",
      :titulo => "MyString",
      :executor => "MyString",
      :tipo => 1,
      :cisImpactados => "MyString"
    ))
  end

  it "renders new checklist_item form" do
    render

    assert_select "form[action=?][method=?]", checklist_items_path, "post" do

      assert_select "input#checklist_item_checklist_id[name=?]", "checklist_item[checklist_id]"

      assert_select "input#checklist_item_nome[name=?]", "checklist_item[nome]"

      assert_select "input#checklist_item_titulo[name=?]", "checklist_item[titulo]"

      assert_select "input#checklist_item_executor[name=?]", "checklist_item[executor]"

      assert_select "input#checklist_item_tipo[name=?]", "checklist_item[tipo]"

      assert_select "input#checklist_item_cisImpactados[name=?]", "checklist_item[cisImpactados]"
    end
  end
end
