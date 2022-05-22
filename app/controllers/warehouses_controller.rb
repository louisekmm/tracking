class WarehousesController < ApplicationController

  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])

    @instock_count = @warehouse.inventory_items.where(status: "In stock").count
    @reserved_count = @warehouse.inventory_items.where(status: "Reserved").count
    @incoming_count = @warehouse.inventory_items.where(status: "Incoming").count
    @sold_count = @warehouse.inventory_items.where(status: "Sold").count
    @total_count = InventoryItem.where(warehouse_id: params[:id]).count

    @expired_count = @warehouse.inventory_items.where(expiration_date: ..-1.days.from_now).count
    @sale_count = @warehouse.inventory_items.where(expiration_date: 0.days.from_now..3.days.from_now).count
    @warehouse_count = @warehouse.inventory_items.group_by(&:product_id).count

    @alerts = Array.new
    @warehouse.inventory_items.each do |item|
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
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save
      redirect_to @warehouse
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])

    if @warehouse.update(warehouse_params)
      redirect_to @warehouse
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse = Warehouse.find(params[:id])
    @warehouse.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :zip_code, :city, :province)
  end

end
