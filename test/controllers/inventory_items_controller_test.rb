require "test_helper"

class InventoryItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = Product.first
  end

  test "POST inventory_items#create creates a new inventory item based on the product being passed" do
    post "/products/#{@product.id}/inventory_items", :params => {
      :product_id => @product.id,
      :inventory_item => {
        :status => "Stock",
        :barcode => "10",
        :lot_number => "10",
        :expiration_date => Date.today,
        :size => "10",
        :warehouse_id => Warehouse.first.id
      }
    }

    new_inventory_item = assigns(:inventory_item)
    assert InventoryItem.find(new_inventory_item.id)
  end

  test "PUT inventory_items#edit edits an inventory item property" do
    inventory_item_id = @product.inventory_items.first.id

    put "/products/#{@product.id}/inventory_items/#{inventory_item_id}", :params => {
      :product_id => @product.id,
      :inventory_item => {
        :status => "Reserved"
      }
    }

    assert_equal InventoryItem.find(inventory_item_id).status, "Reserved"
  end

  test "PUT inventory_items#edit fails validation if trying to edit an inventory item property with an invalid value" do
    inventory_item_id = @product.inventory_items.first.id

    put "/products/#{@product.id}/inventory_items/#{inventory_item_id}", :params => {
      :product_id => @product.id,
      :inventory_item => {
        :status => "Invalid state"
      }
    }

    refute_equal InventoryItem.find(inventory_item_id).status, "Invalid state"
  end

  test "DELETE inventory_items#destroy should delete the inventory item" do
    inventory_item_id = @product.inventory_items.first.id

    delete "/products/#{@product.id}/inventory_items/#{inventory_item_id}", :params => {
      :product_id => @product.id
    }

    assert_nil InventoryItem.find_by(id: inventory_item_id)
  end
end
