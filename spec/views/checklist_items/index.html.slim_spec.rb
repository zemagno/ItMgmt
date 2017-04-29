require 'rails_helper'

RSpec.describe "checklist_items/index", type: :view do
  before(:each) do
    assign(:checklist_items, [
      ChecklistItem.create!(
        :checklist_id => 2,
        :nome => "Nome",
        :titulo => "Titulo",
        :executor => "Executor",
        :tipo => 3,
        :cisImpactados => "Cis Impactados"
      ),
      ChecklistItem.create!(
        :checklist_id => 2,
        :nome => "Nome",
        :titulo => "Titulo",
        :executor => "Executor",
        :tipo => 3,
        :cisImpactados => "Cis Impactados"
      )
    ])
  end

  it "renders a list of checklist_items" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    assert_select "tr>td", :text => "Executor".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Cis Impactados".to_s, :count => 2
  end
end
