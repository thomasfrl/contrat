class Fight < ApplicationRecord
  belongs_to :winner, class_name: "Fighter"
  belongs_to :loser, class_name: "Fighter"
  has_many :registrations
  has_many :fighters, through: :registrations 
end
