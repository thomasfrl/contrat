FactoryBot.define do
  factory :fight do
    fighter_1 {Fighter.first}
    fighter_2 {Fighter.last}
    weapons_fighter1_ids {[Weapon.ids.sample]}
    weapons_fighter2_ids {[Weapon.ids.sample]}
  end
end
