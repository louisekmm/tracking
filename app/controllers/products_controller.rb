class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @instock_count = InventoryItem.where(product_id: params[:id], status: "In stock").count
    @reserved_count = InventoryItem.where(product_id: params[:id], status: "Reserved").count
    @incoming_count = InventoryItem.where(product_id: params[:id], status: "Incoming").count
    @sold_count = InventoryItem.where(product_id: params[:id], status: "SOLD").count
    @total_count = InventoryItem.where(product_id: params[:id]).count

    @expired_count = InventoryItem.where(InventoryItem.arel_table[:expiration_date].lt(Date.current)).count
    @sale_count = InventoryItem.where(InventoryItem.arel_table[:expiration_date].gt(Date.current)).count

    if @expired_count > 0
      @alert = "Expired"
    end

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :weight, :price, :brand)
    end

end
