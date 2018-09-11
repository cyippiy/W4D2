class Cat < ApplicationRecord
  COLORS = ['Red', "Green", "Blue", "Yellow", "Purple", "Orange", "Black", "White", "Grey"]
  
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, 
    message: "Choose a standard color" }
  validates :sex, inclusion: { in: %w(M F),
    message: "Choose either M or F" } 
end
