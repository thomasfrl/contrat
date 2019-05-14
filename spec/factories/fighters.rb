FactoryBot.define do
  factory :fighter do
    name { Faker::Name.first_name }
    life { rand(7)+2 }
    attack { rand(3)+1 }
    xp { rand(6) }
  end
end
