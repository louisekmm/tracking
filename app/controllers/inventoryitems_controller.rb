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
    @inventoryitem = @product.inventoryitems.find(params[:product_id])
  end

  def update
    @product = Product.find(params[:product_id])
    @inventoryitem = @product.inventoryitems.find(params[:product_id])

    if @inventoryitem.update(inventoryitem_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @inventoryitem = @product.inventoryitems.find(params[:product_id])

    @inventoryitem.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def inventoryitem_params
      params.require(:inventoryitem).permit(:instock_qty, :incoming_qty, :reserved_qty, :min_instock_qty, :max_instock_qty, :expiration_date, :size)
    end

end
