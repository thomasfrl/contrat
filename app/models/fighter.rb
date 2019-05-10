class Fighter < ApplicationRecord
  has_many :fights_1, class_name: "Fight", foreign_key: "fighter_1_id", dependent: :destroy
  has_many :fights_2, class_name: "Fight", foreign_key: "fighter_2_id", dependent: :destroy
  has_one_attached :avatar
end
