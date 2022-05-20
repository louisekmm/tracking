class WarehouseInventoryItem < ApplicationRecord

  belongs_to :warehouse
  belongs_to :inventory_item

end
