class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING),
  message: "Choose either APPROVED, DENIED, OR PENDING"}
  
  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat
    
  def overlapping_requests
    start_date1= self.start_date.dup 
    end_date1 = self.end_date.dup
    CatRentalRequest.where(cat_id: self.cat_id).where(start_date BETWEEN start_date1 AND end_date1)
    
    CatRentalRequest.where.not(id: self.id)
    .where(cat_id: cat_id)
    .where.not('start_date > :end_date or end_date < :start_date',start_date: start_date, end_date: end_date)
  end 
end
