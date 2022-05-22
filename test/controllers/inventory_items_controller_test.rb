require "test_helper"

class InventoryItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = Product.first
  end

  test "POST inventory_items#create creates a new inventory item based on the product being passed" do
    post "/products/#{@product.id}/inventory_items", :params => {
      :product_id => @product.id,
      :inventory_item => {
        :status => "In stock",
        :barcode => "10",
        :lot_number => "10",
        :expiration_date => Time.now,
        :size => "10",
        :warehouse_id => "one"
      }
    }

    inventory_item = assigns(:inventory_item)
    assert_equal inventory_item.product_id, @product.id
  end

  test "PUT inventory_items#edit edits an inventory item properties" do
    inventory_item = @product.inventory_items.first

    put "/products/#{@product.id}/inventory_items/#{inventory_item.id}", :params => {
      :product_id => @product.id,
      :inventory_item => {
        :status => "No stock"
      }
    }

    refute_equal inventory_item.status, assigns(:inventory_item).status
  end
end
