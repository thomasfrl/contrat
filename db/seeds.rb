# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Fight.destroy_all
Weapon.destroy_all
Fighter.destroy_all

def get_random_image_avatar
  image_path_prefix = "app/assets/images/fighter/avatar/"
  image_files = Dir.glob("#{image_path_prefix}*")
  image_select = image_files.sample
  [image_select, image_select.split(image_path_prefix)[1]]
end

4.times do
  img = get_random_image_avatar
  fighter = Fighter.create!(name: Faker::Name.first_name, life: rand(7)+2, attack: rand(3)+1, xp: 0)
  fighter.avatar.attach(io: File.open(img[0]), filename: img[1])

end
puts "fighters create"

Weapon.create!(name: "Sword", defense_bonus: 0, attack_bonus: 2)
Weapon.create!(name: "Shield", defense_bonus: 1, attack_bonus: 0)
Weapon.create!(name: "Helmet", defense_bonus: 1, attack_bonus: 0)
Weapon.create!(name: "Armor", defense_bonus: 1, attack_bonus: 0)
Weapon.create!(name: "Ax", defense_bonus: 0, attack_bonus: 1)
Weapon.create!(name: "Spear", defense_bonus: 0, attack_bonus: 1)
puts "weapons create"


Fighter.all.each do |fighter|
  2.times do |i|
    weapons_fighter1 = [Weapon.ids.sample]
    weapons_fighter2 = [Weapon.ids.sample]
    f = Fight.create!(fighter_1: fighter, fighter_2: Fighter.where.not(id: fighter.id).sample, weapons_fighter1_ids: weapons_fighter1, weapons_fighter2_ids: weapons_fighter2)
  end
end
puts "fights create"



