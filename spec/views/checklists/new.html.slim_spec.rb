require 'rails_helper'

RSpec.describe "checklists/new", type: :view do
  before(:each) do
    assign(:checklist, Checklist.new(
      :nome => "MyString",
      :status => 1,
      :docs => "MyString"
    ))
  end

  it "renders new checklist form" do
    render

    assert_select "form[action=?][method=?]", checklists_path, "post" do

      assert_select "input#checklist_nome[name=?]", "checklist[nome]"

      assert_select "input#checklist_status[name=?]", "checklist[status]"

      assert_select "input#checklist_docs[name=?]", "checklist[docs]"
    end
  end
end
