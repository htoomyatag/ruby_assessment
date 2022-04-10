class Api::V1::CurrenciesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admins?
  skip_before_action :verify_authenticity_token

  def index
    @currencies = Api::V1::Currency.all
    render json: @currencies
  end

  def create
    @currency = Api::V1::Currency.new(country_params)
    @currency.save
    render json: { message: 'Created' }
  end

  def remove
     @currency = Api::V1::Currency.find(params[:id])
     @currency.delete
     render json: { message: 'Deleted' }
  end

  private
    def country_params
      params.require(:currency).permit(:title, :currency_code)
    end
end
