class InventoryItemsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @inventory_items = @product.inventory_items.all
  end

  def new
    @product = Product.find(params[:product_id])
    @inventory_item = @product.inventory_items.new
  end

  def create
    @product = Product.find(params[:product_id])
    @inventory_item = @product.inventory_items.new(inventory_item_params)

    if @inventory_item.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @inventory_item = @product.inventory_items.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @inventory_item = @product.inventory_items.find(params[:id])

    if @inventory_item.update(inventory_item_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @inventory_item = @product.inventory_items.find(params[:id])

    @inventory_item.destroy

    redirect_to root_path, status: 303
  end

  private
    def inventory_item_params
      params.require(:inventory_item).permit(:status, :barcode, :lot_number, :expiration_date, :size)
    end

end
