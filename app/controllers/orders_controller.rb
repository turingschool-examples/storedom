class OrdersController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @orders = Order.all

    respond_with @orders
  end

  def show
    @order = Order.find(params[:id])

    respond_with @order
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      respond_to do |format|
        format.html { redirect_to order_path(@order), notice: "Successfully created order"}
        format.json { render json: @order}
        format.xml { render xml: @order}
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:error] = "Unsuccessfull"
          render :edit
        end
        format.json { render json: @order.errors.full_messages }
        format.xml { render xml: @order.errors.full_messages }
      end
    end
  end

  def update
    @order = Order.find_by(id: params[:id])

    if @order.update_attributes(order_params)
      respond_to do |format|
        format.html { redirect_to order_path(@order), notice: "Successfully updated order"}
        format.json { render json: @order}
        format.xml { render xml: @order}
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:error] = "Unsuccessfull"
          render :edit
        end
        format.json { render json: @order.errors.full_messages }
        format.xml { render xml: @order.errors.full_messages }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:id, :amount, :user_id)
  end

end
