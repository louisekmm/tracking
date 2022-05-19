class InventoryitemsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @inventoryitem = @product.inventoryitems.new
  end

  def create
    @product = Product.find(params[:product_id])
    @inventoryitem = @product.inventoryitems.create(inventoryitem_params)
    redirect_to product_path(@product)
  end

  def edit
    @product = Product.find(params[:product_id])
    @inventoryitem = @product.inventoryitems.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @inventoryitem = @product.inventoryitems.find(params[:id])

    if @inventoryitem.update(inventoryitem_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @inventoryitem = @product.inventoryitems.find(params[:id])

    @inventoryitem.destroy

    redirect_to root_path, status: 303
  end

  private
    def inventoryitem_params
      params.require(:inventoryitem).permit(:status, :barcode, :lot_number, :expiration_date, :size)
    end

end
