require 'rails_helper'

RSpec.describe "fighters/edit", type: :view do
  before(:each) do
    @fighter = assign(:fighter, Fighter.create!(
      :name => "MyString",
      :life => 1,
      :attack => 1,
      :xp => 1
    ))
  end

  it "renders the edit fighter form" do
    render

    assert_select "form[action=?][method=?]", fighter_path(@fighter), "post" do

      assert_select "input[name=?]", "fighter[name]"

      assert_select "input[name=?]", "fighter[life]"

      assert_select "input[name=?]", "fighter[attack]"

      assert_select "input[name=?]", "fighter[xp]"
    end
  end
end
