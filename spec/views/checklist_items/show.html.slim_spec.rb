require 'rails_helper'

RSpec.describe "checklist_items/show", type: :view do
  before(:each) do
    @checklist_item = assign(:checklist_item, ChecklistItem.create!(
      :checklist_id => 2,
      :nome => "Nome",
      :titulo => "Titulo",
      :executor => "Executor",
      :tipo => 3,
      :cisImpactados => "Cis Impactados"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(/Executor/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Cis Impactados/)
  end
end
