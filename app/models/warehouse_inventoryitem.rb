class WarehouseInventoryitem < ApplicationRecord
  belongs_to :warehouse
  belongs_to :inventoryitem
end
