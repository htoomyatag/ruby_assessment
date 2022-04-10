class Api::V1::LineItemsController < ApplicationController

  skip_before_action :verify_authenticity_token


  def add_to_cart
    # Find associated product and current cart
    chosen_product = Api::V1::Product.find(params[:product_id])
    current_cart = @current_cart

    if chosen_product.stock > params[:quantity].to_i-1

        # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
        if current_cart.products.include?(chosen_product)
          # Find the line_item with the chosen_product
          @line_item = current_cart.line_items.find_by(:product_id => chosen_product)
          @line_item.quantity += params[:quantity].to_i
        else
          @line_item = Api::V1::LineItem.new(:cart_id => current_cart.id,:product_id => chosen_product.id, :quantity => params[:quantity])
        end
        @line_item.save
        chosen_product.stock = chosen_product.stock-params[:quantity].to_i
        chosen_product.save
        render json: { message: 'Added to cart' }
    else
        render json: { message: 'Out of stock' }
    end
  end

  def add_quantity
      #add quanity plus one
      @line_item = Api::V1::LineItem.find(params[:id])
      @line_item.quantity += 1
      @line_item.save
      render json: { message: 'Added Qty' }
  end

  def reduce_quantity
     #reduce quanity minus one
    @line_item = Api::V1::LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    @line_item.save
    render json: { message: 'Reduced Qty' }
  end

  def remove_allproduct_in_cart
      all_product_in_cart = Api::V1::LineItem.where(:cart_id => params[:cart_id])
      all_product_in_cart.delete_all
     render json: { message: "All items in cart has been removed" }
  end


  def remove_product_in_cart
      desire_product = Api::V1::LineItem.where(:product_id => params[:product_id]).where(:cart_id => params[:cart_id])
      desire_product.delete_all
      render json: { message: "An item in cart has been removed" }
  end

  def index
      @line_items = Api::V1::LineItem.where(:cart_id => params[:cart_id])
      render json: @line_items
  end


  private
    # Only allow a list of trusted parameters through.
    def api_v1_line_item_params
      params.require(:api_v1_line_item).permit(:quantity, :product_id, :cart_id, :order_id)
    end
end
