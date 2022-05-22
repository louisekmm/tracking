class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    @instock_count = @product.inventory_items.where(status: "In stock").count
    @reserved_count = @product.inventory_items.where(status: "Reserved").count
    @incoming_count = @product.inventory_items.where(status: "Incoming").count
    @sold_count = @product.inventory_items.where(status: "Sold").count
    @total_count = InventoryItem.where(product_id: params[:id]).count

    @expired_count = @product.inventory_items.where(expiration_date: ..-1.days.from_now).count
    @sale_count = @product.inventory_items.where(expiration_date: 0.days.from_now..3.days.from_now).count
    @warehouse_count = @product.inventory_items.group_by(&:warehouse_id).count

    @alerts = Array.new
    @product.inventory_items.each do |item|
      if item.expiration_date < Date.current
        Array(@alerts).push('Expired')
      elsif item.expiration_date <= Date.current + 3.days
        Array(@alerts).push('Time for sale')
      else
        Array(@alerts).push('None')
      end
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
