class OrdersController < ApplicationController
  before_filter :load_restaurant
  before_action :set_order, only: [:show, :edit, :update, :destroy, :send_receipt]

  # GET /orders
  def index
    @orders = @restaurant.orders.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = @restaurant.orders.new
    @ordered_item = @order.ordered_items.build
    @items = @restaurant.items
    @items_by_category = @items.group_by{ |t| t.subcategory }
  end

  # GET /orders/1/edit
  def edit
    authorize @order
  end

  # POST /orders
  def create
    @order = @restaurant.orders.new(order_params)
    authorize @order

    if @order.save
      @order.inventory_check(@order, @restaurant)
      current_user.orders << @order
      respond_to do |format|
        format.html { redirect_to restaurant_order_path(@restaurant, @order), notice: 'Order was successfully created.' }
        format.js
      end
    else
      render action: 'new'
    end
    OrderMailer.order_sent(@restaurant, @order).deliver
  end

  # PATCH/PUT /orders/1
  def update
    authorize @order

    if @order.update(order_params)
      @order.inventory_check(@order, @restaurant)
      respond_to do |format|
        format.html { redirect_to restaurant_orders_url, notice: 'Order was successfully updated.' }
        format.js
      end
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  def destroy
    authorize @order
    @order.inventory_check_before_deletion(@order, @restaurant)
    @order.destroy
    respond_to do |format|
      format.html { redirect_to  restaurant_orders_url, notice: 'Order was successfully destroyed.' }
      format.js
    end
  end

  def send_receipt
    authorize @order
    OrderMailer.send_receipt(@order).deliver
    redirect_to restaurant_orders_url, notice: 'Receipt was successfully sent!'
  end

  private

    def load_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = @restaurant.orders.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:item_id, :quantity, :note, :restaurant_id,
        :user_id, :user, :item_to_be_added, :finalize, :completed, :ordered_item, ordered_items_attributes: [:ordered_item_id, :restaurant_id, '_destroy', :item_id, :quantity, :note, :user_id])
    end
end
