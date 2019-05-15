class Fight < ApplicationRecord
  after_create :who_won
  belongs_to :fighter_1, class_name: "Fighter"
  belongs_to :fighter_2, class_name: "Fighter"
  validate :weapons_1_ids

  def weapons_1_ids
    unless weapons_fighter1_ids.empty? 
      if weapons_fighter1_ids.detect{|id| !Weapon.ids.include?(id)}
        errors.add(:weapons_fighter1_ids, :invalid)
      end
    end
  end

  validate :weapons_2_ids

  def weapons_2_ids
    unless weapons_fighter2_ids.empty?
      if weapons_fighter2_ids.detect{|id| !Weapon.ids.include?(id)}
        errors.add(:weapons_fighter2_ids, :invalid)
      end
    end
  end

  validate :different_participant

  def different_participant
    errors.add(:fighter_2_id, "can't be the same as Fighter 1") if fighter_1_id == fighter_2_id
  end

  def weapons_fighter1
    self.weapons_fighter1_ids.map {|id| Weapon.find(id)}
  end

  def weapons_fighter2
    self.weapons_fighter2_ids.map {|id| Weapon.find(id)}
  end

  def weapons_winner
    if self.winner == self.fighter_1
      return self.weapons_fighter1
    else
      return self.weapons_fighter2
    end
  end

  def weapons_loser
    if self.winner == self.fighter_1
      return self.weapons_fighter2
    else
      return self.weapons_fighter1
    end
  end


  def loser
    self.win == 1 ? self.fighter_2 : self.fighter_1
  end

  def winner
    self.win == 1 ? self.fighter_1 : self.fighter_2
  end

  
  def fighter1_total_attack
    self.weapons_fighter1.inject(0) {|sum, weapon| sum + weapon.attack_bonus}
  end

  def fighter2_total_attack
    self.weapons_fighter2.inject(0) {|sum, weapon| sum + weapon.attack_bonus}
  end

  def fighter1_total_defense
    self.weapons_fighter1.inject(0) {|sum, weapon| sum + weapon.defense_bonus}
  end

  def fighter2_total_defense
    self.weapons_fighter2.inject(0) {|sum, weapon| sum + weapon.defense_bonus}
  end

  def who_won
    life_1 = self.fighter_1.life
    life_2 = self.fighter_2.life
    attack_diff_fighter_1 = [self.fighter_1.attack + self.fighter1_total_attack - self.fighter2_total_defense,0].max
    attack_diff_fighter_2 = [self.fighter_2.attack + self.fighter2_total_attack - self.fighter1_total_defense,0].max
    if attack_diff_fighter_1 != 0 && attack_diff_fighter_2 !=0
      while life_1 > 0 && life_2 > 0 do
        life_1 -= attack_diff_fighter_2
        life_2 -= attack_diff_fighter_1
      end    
      if life_1 <= 0 && life_2 <= 0
        self.update(win: 1)
        self.fighter_1.update_xp
      elsif life_1 <= 0 
        self.update(win: 2)
        self.fighter_2.update_xp
      elsif life_2 <= 0 
        self.update(win: 1)
        self.fighter_1.update_xp
      end
    else
      if attack_diff_fighter_1 >= attack_diff_fighter_2
        self.update(win: 1)
        self.fighter_1.update_xp
      else
        self.update(win: 2)
        self.fighter_2.update_xp
      end
    end
  end
end
