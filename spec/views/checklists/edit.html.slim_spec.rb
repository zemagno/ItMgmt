require 'rails_helper'

RSpec.describe "checklists/edit", type: :view do
  before(:each) do
    @checklist = assign(:checklist, Checklist.create!(
      :nome => "MyString",
      :status => 1,
      :docs => "MyString"
    ))
  end

  it "renders the edit checklist form" do
    render

    assert_select "form[action=?][method=?]", checklist_path(@checklist), "post" do

      assert_select "input#checklist_nome[name=?]", "checklist[nome]"

      assert_select "input#checklist_status[name=?]", "checklist[status]"

      assert_select "input#checklist_docs[name=?]", "checklist[docs]"
    end
  end
end
