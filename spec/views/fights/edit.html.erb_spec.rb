require 'rails_helper'

RSpec.describe "fights/edit", type: :view do
  before(:each) do
    @fight = assign(:fight, Fight.create!(
      :winner => nil,
      :loser => nil
    ))
  end

  it "renders the edit fight form" do
    render

    assert_select "form[action=?][method=?]", fight_path(@fight), "post" do

      assert_select "input[name=?]", "fight[winner_id]"

      assert_select "input[name=?]", "fight[loser_id]"
    end
  end
end
