# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Registration.destroy_all
Fight.destroy_all
Weapon.destroy_all
Fighter.destroy_all

10.times do 
  fighter = Fighter.create!(name: Faker::Name.first_name, life: rand(7)+2, attack: rand(3), xp: 0)
end

Fighter.all.each do |fighter|
  5.times do |i|
    Fight.create!(winner: fighter, loser: Fighter.where.not(id: fighter.id).sample)
  end
end

