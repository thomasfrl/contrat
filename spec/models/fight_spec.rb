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
    describe "#fighter" do
      it "should not be valid without fighter_1" do
        bad_fight = FactoryBot.build(:fight, fighter_1: nil)
        expect(bad_fight).not_to be_valid
        expect(bad_fight.errors.include?(:fighter_1)).to eq(true)
      end
      it "should not be valid without fighter_2" do
        bad_fight = FactoryBot.build(:fight, fighter_2: nil)
        expect(bad_fight).not_to be_valid
        expect(bad_fight.errors.include?(:fighter_2)).to eq(true)
      end

      it "should not be valid with two same fighters" do
        bad_fight = FactoryBot.build(:fight, fighter_1: Fighter.first, fighter_2: Fighter.first)
        expect(bad_fight).not_to be_valid
        expect(bad_fight.errors.include?(:fighter_2_id)).to eq(true)
      end
    end
    describe "#weapons" do
      it "should not be valid with not valid weapon" do
        bad_fight = FactoryBot.build(:fight, weapons_fighter1_ids: [-5.2])
        bad_fight2 = FactoryBot.build(:fight, weapons_fighter2_ids: [-5.2])
        expect(bad_fight).not_to be_valid
        expect(bad_fight.errors.include?(:weapons_fighter2_ids)).to eq(true)
        expect(bad_fight2).not_to be_valid
        expect(bad_fight2.errors.include?(:weapons_fighter2_ids)).to eq(true)
      end
    end
  end

  context "public instance methods" do
    describe "#weapons_fighter1" do
      it "should return the weapon of the fighter_1" do
        fight = FactoryBot.build(:fight, weapons_fighter1_ids: [Weapon.first.id])
        expect(fight.weapons_fighter1.size).to eq(1)
        expect(fight.weapons_fighter1.first).to be_a(Weapon)
        expect(fight.weapons_fighter1).to eq([Weapon.first])
      end
    end

    describe "#weapons_fighter2" do
      it "should return the weapon of the fighter_2" do
        fight = FactoryBot.build(:fight, weapons_fighter2_ids: [Weapon.first.id])
        expect(fight.weapons_fighter2.size).to eq(1)
        expect(fight.weapons_fighter2.first).to be_a(Weapon)
        expect(fight.weapons_fighter2).to eq([Weapon.first])
      end
    end
    describe "#who_won" do
      it "should return the number of the winner" do
        fighter1 = FactoryBot.build(:fighter, life: 8, attack:3)
        fighter2 = FactoryBot.build(:fighter, life: 4, attack:1)
        fighter3 = FactoryBot.build(:fighter, life: 2, attack:2)
        fighter4 = FactoryBot.build(:fighter, life: 1, attack:5)
        fight1 = FactoryBot.build(:fight, fighter_1: fighter1,fighter_2: fighter2, weapons_fighter1_ids:[], weapons_fighter2_ids:[])
        fight2 = FactoryBot.build(:fight, fighter_1: fighter3,fighter_2: fighter2, weapons_fighter1_ids:[], weapons_fighter2_ids:[])
        fight3 = FactoryBot.build(:fight, fighter_1: fighter4,fighter_2: fighter2, weapons_fighter1_ids:[], weapons_fighter2_ids:[])
        fight1.who_won
        fight2.who_won
        fight3.who_won
        expect(fight1.win).to eq(1)
        expect(fight2.win).to eq(1)
        expect(fight3.win).to eq(1)
      end
    end
    describe "#winner" do
      it "should return the winner" do
        fighter1 = FactoryBot.build(:fighter, life: 8, attack:3)
        fighter2 = FactoryBot.build(:fighter, life: 4, attack:1)
        fighter3 = FactoryBot.build(:fighter, life: 2, attack:2)
        fighter4 = FactoryBot.build(:fighter, life: 1, attack:5)
        fight1 = FactoryBot.build(:fight, fighter_1: fighter1,fighter_2: fighter2, weapons_fighter1_ids:[], weapons_fighter2_ids:[])
        fight2 = FactoryBot.build(:fight, fighter_1: fighter3,fighter_2: fighter2, weapons_fighter1_ids:[], weapons_fighter2_ids:[])
        fight3 = FactoryBot.build(:fight, fighter_1: fighter4,fighter_2: fighter2, weapons_fighter1_ids:[], weapons_fighter2_ids:[])
        fight1.who_won
        fight2.who_won
        fight3.who_won
        expect(fight1.winner).to eq(fighter1)
        expect(fight2.winner).to eq(fighter3)
        expect(fight3.winner).to eq(fighter4)
      end
    end
    describe "#loser" do
      it "should return the loser" do
        fighter1 = FactoryBot.build(:fighter, life: 8, attack:3)
        fighter2 = FactoryBot.build(:fighter, life: 4, attack:1)
        fighter3 = FactoryBot.build(:fighter, life: 2, attack:2)
        fighter4 = FactoryBot.build(:fighter, life: 1, attack:5)
        fight1 = FactoryBot.build(:fight, fighter_1: fighter1,fighter_2: fighter2, weapons_fighter1_ids:[], weapons_fighter2_ids:[])
        fight2 = FactoryBot.build(:fight, fighter_1: fighter3,fighter_2: fighter2, weapons_fighter1_ids:[], weapons_fighter2_ids:[])
        fight3 = FactoryBot.build(:fight, fighter_1: fighter4,fighter_2: fighter2, weapons_fighter1_ids:[], weapons_fighter2_ids:[])
        fight1.who_won
        fight2.who_won
        fight3.who_won
        expect(fight1.loser).to eq(fighter2)
        expect(fight2.loser).to eq(fighter2)
        expect(fight3.loser).to eq(fighter2)
      end
    end
  end
end