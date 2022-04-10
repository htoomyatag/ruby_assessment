class Api::V1::TaxesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admins?
  skip_before_action :verify_authenticity_token

  def index
    @taxes = Api::V1::Tax.all
    render json: @taxes
  end

  def create
    @tax = Api::V1::Tax.new(tax_params)
    @tax.save
    render json: { message: 'Created' }
  end

  def remove
     @tax = Api::V1::Tax.find(params[:id])
     @tax.delete
     render json: { message: 'Deleted' }
  end

  private
    def tax_params
      params.require(:tax).permit(:tax_rate, :tax_category)
    end
end
