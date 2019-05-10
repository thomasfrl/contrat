require 'rails_helper'

RSpec.describe "fights/index", type: :view do
  before(:each) do
    assign(:fights, [
      Fight.create!(
        :winner => nil,
        :loser => nil
      ),
      Fight.create!(
        :winner => nil,
        :loser => nil
      )
    ])
  end

  it "renders a list of fights" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
