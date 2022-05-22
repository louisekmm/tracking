class Warehouse < ApplicationRecord

  has_many :inventory_items, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :zip_code, presence: true, length: { minimum: 7, maximum:7 }, format: { with: /\A[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d\z/, message: "uses canadian format X0X 0X0 uppercase" }
  validates :city, presence: true
  validates :province, presence: true, inclusion: { in: %w(AB BC MB NB NL NS ON PE QC SK),
    message: "%{value} is not a valid province" }

end
