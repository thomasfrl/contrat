class Registration < ApplicationRecord
  belongs_to :weapon
  belongs_to :fight
  belongs_to :fighter
end
