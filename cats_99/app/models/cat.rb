class Cat < ApplicationRecord
  COLORS = ['Red', "Green", "Blue", "Yellow", "Purple", "Orange", "Black", "White", "Grey"]
  
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, 
    message: "Choose a standard color" }
  validates :sex, inclusion: { in: %w(M F),
    message: "Choose either M or F" } 
    
  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
end
