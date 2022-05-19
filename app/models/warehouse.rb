class Warehouse < ApplicationRecord
  has_many :warehouse_owners
  has_many :inventoryitems, through: :dog_owners
end
