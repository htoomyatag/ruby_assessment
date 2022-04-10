class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create,:remove,:update_order]
  before_action :is_admins?, only: [:index,:create,:remove,:update_order]
  skip_before_action :verify_authenticity_token

  def add_to_order

     first_name = params[:first_name]
     last_name = params[:last_name]
     shipping_address = params[:shipping_address]
     total_amount = calculate_total_amount(params[:cart_id])
 

    @api_v1_order = Api::V1::Order.new(:first_name => first_name,:last_name => last_name,:shipping_address => shipping_address,:order_total => total_amount.round(2))
    @current_cart.line_items.each do |item|
      @api_v1_order.line_items << item
      item.cart_id = nil
    end
    @api_v1_order.save
    Api::V1::Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    render json: { message: 'Added' }
  end


  def calculate_total_amount(cart)
     
     sum = 0
        Api::V1::LineItem.where(:cart_id=>@current_cart.id).each do |line_item|
          #calcualte tax rate for product
          tax_rate = line_item.product.region.tax.tax_rate * line_item.product.price
     
          #plus product value with tax
          product_price_with_tax = tax_rate + line_item.product.price
      
          #total product value
          sum+= line_item.quantity * product_price_with_tax
        end
        return sum
     
  end

  def show
    @order = Api::V1::Order.find(params[:id])
    render json: @order
  end


  def create
    @order = Api::V1::Order.new(api_v1_order_params)
    @order.save
    render json: { message: 'Created' }
  end


  def update_order
    order = Api::V1::Order.find(params[:id])
    order.first_name = params[:first_name]
    order.last_name = params[:last_name]
    order.shipping_address = params[:shipping_address]
    order.order_total = params[:order_total]
    order.paid_at = params[:paid_at]
    order.payment_status = params[:payment_status]
    order.save
    render json: { message: 'Updated' }
  end

  def remove
    @order = Api::V1::Order.find(params[:id])
    @order.delete
    render json: { message: 'Removed' }
  end


  def index
    @orders = Api::V1::Order.all
    render json: @orders
  end


  private
  
    # Only allow a list of trusted parameters through.
    def api_v1_order_params
      params.require(:api_v1_order).permit(:first_name, :last_name, :shipping_address, :order_total, :paid_at, :payment_status)
    end
end
