class PurchaseMedicine < ApplicationRecord
  belongs_to :purchase, optional: true
  has_many :medicines
end
