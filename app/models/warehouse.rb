class Warehouse < ApplicationRecord
  has_many :warehouse_inventoryitems, dependent: :destroy
  has_many :inventoryitems, through: :warehouse_inventoryitems
end
