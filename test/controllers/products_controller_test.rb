require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = Product.first
  end

  test "POST product#create creates a new product" do
    post "/products", :params => {
      :product => {
        :name => "Pech",
        :description => "Delicious peach",
        :weight => 2,
        :price => 3.9,
        :brand => "Surgarpeach"
      }
    }

    new_product = assigns(:product)
    assert Product.find(new_product.id)
  end

  test "PUT product#update edits a product property" do
    product_id = @product.id

    put "/products/#{product_id}", :params => {
      :product => {
        :price => 4
      }
    }

    assert_equal Product.find(product_id).price, 4
  end

  test "DELETE product#destroy should delete the product" do
    product_id = @product.id

    delete "/products/#{product_id}"

    assert_nil Product.find_by(id: product_id)
  end
end
