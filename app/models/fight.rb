class Fight < ApplicationRecord
  after_create :who_won
  belongs_to :fighter_1, class_name: "Fighter"
  belongs_to :fighter_2, class_name: "Fighter"
  belongs_to :fighter1_weapon, class_name: "Weapon"
  belongs_to :fighter2_weapon, class_name: "Weapon"

  def loser
    
  end

  private
  def who_won
    life_1 = self.fighter_1.life
    life_2 = self.fighter_2.life
    while life_1 > 0 && life_2 > 0 do
      life_1 -= self.fighter_2.attack + fighter2_weapon.attack_bonus - fighter1_weapon.defense_bonus
      life_2 -= self.fighter_1.attack + fighter1_weapon.attack_bonus - fighter2_weapon.defense_bonus
    end
    if life_1 <= 0 && life_2 <= 0
      self.update(winner: 1)
      self.fighter_1.update(xp: self.fighter_1.xp+1)
    elsif life_1 <= 0 
      self.update(winner: 2)
      self.fighter_2.update(xp: self.fighter_2.xp+1)
    elsif life_2 <= 0 
      self.update(winner: 1)
      self.fighter_1.update(xp: self.fighter_1.xp+1)
    end
  end
end
