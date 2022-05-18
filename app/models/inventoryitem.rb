class Inventoryitem < ApplicationRecord

  belongs_to :product

  validates :instock_qty, presence: true, numericality: { only_integer: true }
  validates :incoming_qty, presence: true, numericality: { only_integer: true }
  validates :reserved_qty, presence: true, numericality: { only_integer: true }
  validates :min_instock_qty, presence: true, numericality: { only_integer: true }
  validates :max_instock_qty, presence: true, numericality: { only_integer: true }
  validates :expiration_date, presence: true, format: { with: /\d{4}\-\d{2}\-\d{2}/, message: "must be yyyy-mm-dd" }
  validates :size, presence: true
end
