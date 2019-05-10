class Fight < ApplicationRecord
  after_create :who_won
  belongs_to :fighter_1, class_name: "Fighter"
  belongs_to :fighter_2, class_name: "Fighter"
  belongs_to :fighter1_weapon, class_name: "Weapon"
  belongs_to :fighter2_weapon, class_name: "Weapon"


  private
  def who_won
    while self.fighter_1.life > 0 && self.fighter_2.life > 0 do
      self.fighter_1.life -= self.fighter_2.attack + fighter2_weapon.attack_bonus - fighter1_weapon.defense_bonus
      self.fighter_2.life -= self.fighter_1.attack + fighter1_weapon.attack_bonus - fighter2_weapon.defense_bonus
    end
    if self.fighter_1.life <= 0 && self.fighter_2.life <= 0
      self.update(winner: 1)
      self.fighter_1.update(xp: self.fighter_1.xp+1)
    elsif self.fighter_1.life <= 0 
      self.update(winner: 2)
      self.fighter_2.update(xp: self.fighter_2.xp+1)
    elsif self.fighter_2.life <= 0 
      self.update(winner: 1)
      self.fighter_1.update(xp: self.fighter_1.xp+1)
    end
  end
end
