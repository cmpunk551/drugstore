class Purchase < ApplicationRecord
  belongs_to :user, optional: true
  has_many :purchase_medicines
  before_create :update_status
  before_save :update_total

  def calculate_total
    self.purchase_medicines.collect { |medicine| medicine.amount * Medicine.find(medicine.medicine_id).price }.sum
  end

  private 

  def update_status
    if self.status.nil?
      self.status = "Создана"
    end
  end

  def update_total
    self.total_cost = calculate_total
  end

end
