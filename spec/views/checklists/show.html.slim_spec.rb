require 'rails_helper'

RSpec.describe "checklists/show", type: :view do
  before(:each) do
    @checklist = assign(:checklist, Checklist.create!(
      :nome => "Nome",
      :status => 2,
      :docs => "Docs"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Docs/)
  end
end
