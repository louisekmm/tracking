class InventoryItem < ApplicationRecord

  belongs_to :product

  has_many :warehouse_inventory_items, dependent: :destroy
  has_many :warehouses, through: :warehouse_inventory_items

  validates :status, presence: true
  validates :barcode, presence: true
  validates :lot_number, presence: true
  validates :expiration_date, presence: true, format: { with: /\d{4}\-\d{2}\-\d{2}/, message: "must be yyyy-mm-dd" }
  validates :size, presence: true
end
