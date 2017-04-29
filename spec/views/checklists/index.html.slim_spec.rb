require 'rails_helper'

RSpec.describe "checklists/index", type: :view do
  before(:each) do
    assign(:checklists, [
      Checklist.create!(
        :nome => "Nome",
        :status => 2,
        :docs => "Docs"
      ),
      Checklist.create!(
        :nome => "Nome",
        :status => 2,
        :docs => "Docs"
      )
    ])
  end

  it "renders a list of checklists" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Docs".to_s, :count => 2
  end
end
