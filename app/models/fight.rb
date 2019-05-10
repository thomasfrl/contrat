class Fight < ApplicationRecord
  after_create :who_won
  belongs_to :fighter_1, class_name: "Fighter"
  belongs_to :fghter_2, class_name: "Fighter"
  belongs_to :fighter1_weapon, class_name: "Weapon"
  belongs_to :fighter2_weapon, class_name: "Weapon"


  private
  def who_won
    while self.fighter_1.life > 0 && self.fighter_2.life > 0 do
      self.fighter_1.life -= self.fighter_2.attack 
      self.fighter_2.life -= self.fighter_1.attack
    end
    if self.fighter_1.life == 0 && self.fighter_2.life == 0
      winner = 1
    elsif self.fighter_1.life == 0 
      winner = 2
    elsif self.fighter_2.life == 0 
      winner = 1
    end
  end

end
