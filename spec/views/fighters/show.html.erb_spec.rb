require 'rails_helper'

RSpec.describe "fighters/show", type: :view do
  before(:each) do
    @fighter = assign(:fighter, Fighter.create!(
      :name => "Name",
      :life => 2,
      :attack => 3,
      :xp => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
