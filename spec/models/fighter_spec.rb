require 'rails_helper'

RSpec.describe Fighter, type: :model do
  context "validation" do

    it "is valid with valid attributes" do
      fighter = FactoryBot.build(:fighter)
      expect(fighter).to be_a(Fighter)
      expect(fighter).to be_valid
    end
    describe "#life" do
      it "should not be valid without life" do
        bad_fighter = FactoryBot.build(:fighter, life: nil)
        expect(bad_fighter).not_to be_valid
        expect(bad_fighter.errors.include?(:life)).to eq(true)
      end

      it "should not be valid with a negatif life" do
        bad_fighter = FactoryBot.build(:fighter, life: -5)
        expect(bad_fighter).not_to be_valid
        expect(bad_fighter.errors.include?(:life)).to eq(true)
      end
    end
    describe "#attack" do
      it "should not be valid without attack" do
        bad_fighter = FactoryBot.build(:fighter, attack: nil)
        expect(bad_fighter).not_to be_valid
        expect(bad_fighter.errors.include?(:attack)).to eq(true)
      end

      it "should not be valid with a negatif attack" do
        bad_fighter = FactoryBot.build(:fighter, attack: -5)
        expect(bad_fighter).not_to be_valid
        expect(bad_fighter.errors.include?(:attack)).to eq(true)
      end

      it "should not be valid with an attack equal to zero" do
        bad_fighter = FactoryBot.build(:fighter, attack: 0)
        expect(bad_fighter).not_to be_valid
        expect(bad_fighter.errors.include?(:attack)).to eq(true)
      end
    end

    describe "#xp" do
      it "should not be valid without xp" do
        bad_fighter = FactoryBot.build(:fighter, xp: nil)
        expect(bad_fighter).not_to be_valid
        expect(bad_fighter.errors.include?(:xp)).to eq(true)
      end

      it "should not be valid with a negatif xp" do
        bad_fighter = FactoryBot.build(:fighter, xp: -5)
        expect(bad_fighter).not_to be_valid
        expect(bad_fighter.errors.include?(:xp)).to eq(true)
      end
    end
  end
  context "public instance methods" do

    describe "#update_xp" do
      it "should update xp and level up" do
        fighter = FactoryBot.build(:fighter, xp: 9, life:2, attack:2)
        fighter.update_xp
        expect(fighter.xp).to eq(10)
        expect(fighter.life).to eq(3)
        expect(fighter.attack).to eq(3)
      end
      it "should update xp and not level up" do
        fighter = FactoryBot.build(:fighter, xp: 8, life:2, attack:2)
        fighter.update_xp
        expect(fighter.xp).to eq(9)
        expect(fighter.life).to eq(2)
        expect(fighter.attack).to eq(2)
      end

    end
  end
end
