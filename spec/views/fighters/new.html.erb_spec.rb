require 'rails_helper'

RSpec.describe "fighters/new", type: :view do
  before(:each) do
    assign(:fighter, Fighter.new(
      :name => "MyString",
      :life => 1,
      :attack => 1,
      :xp => 1
    ))
  end

  it "renders new fighter form" do
    render

    assert_select "form[action=?][method=?]", fighters_path, "post" do

      assert_select "input[name=?]", "fighter[name]"

      assert_select "input[name=?]", "fighter[life]"

      assert_select "input[name=?]", "fighter[attack]"

      assert_select "input[name=?]", "fighter[xp]"
    end
  end
end
