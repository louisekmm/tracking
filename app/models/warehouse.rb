class Warehouse < ApplicationRecord

  has_many :warehouse_inventory_items, dependent: :destroy
  has_many :inventory_items, through: :warehouse_inventory_items

  validates :name, presence: true, length: { minimum: 3 }
  validates :zip_code, presence: true, length: { minimum: 6 }
  validates :city, presence: true
  validates :province, presence: true

end
