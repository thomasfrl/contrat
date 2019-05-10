require 'rails_helper'

RSpec.describe "fights/new", type: :view do
  before(:each) do
    assign(:fight, Fight.new(
      :winner => nil,
      :loser => nil
    ))
  end

  it "renders new fight form" do
    render

    assert_select "form[action=?][method=?]", fights_path, "post" do

      assert_select "input[name=?]", "fight[winner_id]"

      assert_select "input[name=?]", "fight[loser_id]"
    end
  end
end
