require "test_helper"

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @warehouse = Warehouse.first
  end

  test "POST warehouse#create creates a new warehouse" do
    post "/warehouses", :params => {
      :warehouse => {
        :name => "Ottawa Branch",
        :zip_code => "K1R 7T7",
        :city => "Ottawa",
        :province => "ON",
      }
    }

    new_warehouse = assigns(:warehouse)
    assert Warehouse.find(new_warehouse.id)
  end

  test "PUT warehouse#update edits a warehouse property" do
    warehouse_id = @warehouse.id

    put "/warehouses/#{warehouse_id}", :params => {
      :warehouse => {
        :name => "Ottawa Branch 2",
      }
    }

    assert_equal Warehouse.find(warehouse_id).name, "Ottawa Branch 2"
  end

  test "DELETE warehouse#delete deletes a warehouse" do
    warehouse_id = @warehouse.id

    delete "/warehouses/#{warehouse_id}"

    assert_nil Warehouse.find_by(id: warehouse_id)
  end
end
