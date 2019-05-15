FactoryBot.define do
  factory :fight do
    fighter_1 {FactoryBot.create(:fighter, name: "jean"+rand(1000000).to_s)}
    fighter_2 {FactoryBot.create(:fighter,name: "baptiste"+rand(1000000).to_s)}
    weapons_fighter1_ids {[Weapon.ids.sample]}
    weapons_fighter2_ids {[Weapon.ids.sample]}
  end
end
