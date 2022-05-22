class Warehouse < ApplicationRecord

  has_many :inventory_items

  validates :name, presence: true, length: { minimum: 3 }
  validates :zip_code, presence: true, length: { minimum: 7, maximum:7 }, format: { with: /\A\d{3}\s\d{3}\z/, message: "uses canadian format XXX XXX" }
  validates :city, presence: true
  validates :province, presence: true

end
