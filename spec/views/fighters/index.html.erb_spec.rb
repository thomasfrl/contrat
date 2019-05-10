require 'rails_helper'

RSpec.describe "fighters/index", type: :view do
  before(:each) do
    assign(:fighters, [
      Fighter.create!(
        :name => "Name",
        :life => 2,
        :attack => 3,
        :xp => 4
      ),
      Fighter.create!(
        :name => "Name",
        :life => 2,
        :attack => 3,
        :xp => 4
      )
    ])
  end

  it "renders a list of fighters" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
