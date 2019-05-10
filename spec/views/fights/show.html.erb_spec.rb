require 'rails_helper'

RSpec.describe "fights/show", type: :view do
  before(:each) do
    @fight = assign(:fight, Fight.create!(
      :winner => nil,
      :loser => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
