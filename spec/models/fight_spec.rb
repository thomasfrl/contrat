require 'rails_helper'

RSpec.describe Fight, type: :model do
  before :all do
    Fighter.destroy_all
    Fight.destroy_all
    Weapon.destroy_all

    Weapon.create!(name: "Sword", defense_bonus: 0, attack_bonus: 2)
    Weapon.create!(name: "Shield", defense_bonus: 1, attack_bonus: 0)
    Weapon.create!(name: "Helmet", defense_bonus: 1, attack_bonus: 0)
    Weapon.create!(name: "Armor", defense_bonus: 1, attack_bonus: 0)
    Weapon.create!(name: "Ax", defense_bonus: 0, attack_bonus: 1)
    Weapon.create!(name: "Spear", defense_bonus: 0, attack_bonus: 1)

    10.times do
      FactoryBot.create(:fighter)
    end
    10.times do
      FactoryBot.create(:fight)
    end
  end
  context "validation" do
    it "is valid with valid attributes" do
      fight = FactoryBot.build(:fight)
      expect(fight).to be_a(Fight)
      expect(fight).to be_valid
    end
  end
end