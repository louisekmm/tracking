class WarehouseInventoryitemsController < ApplicationController

  belongs_to :warehouse
  belongs_to :inventoryitem

end
