class Fighter < ApplicationRecord

  validates :name, presence: true,  uniqueness: {case_sensitive: false}
  validates :attack, presence: true, numericality: {greater_than: 0}
  validates :life, presence: true, numericality: {greater_than: 0}
  validates :xp, presence: true, numericality: {greater_than_or_equal_to: 0}


  has_many :attacking_fights, class_name: "Fight", foreign_key: "fighter_1_id", dependent: :destroy
  has_many :defending_fights, class_name: "Fight", foreign_key: "fighter_2_id", dependent: :destroy
  has_one_attached :avatar


  def fights
    self.attacking_fights + self.defending_fights 
  end

  def won_fights
    self.fights.select{|fight| fight.winner == self}
  end

  def lost_fights
    self.fights.select{|fight| fight.loser == self}
  end
end
