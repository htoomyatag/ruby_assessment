class Api::V1::CountriesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admins?
  skip_before_action :verify_authenticity_token

  def index
    @countries = Api::V1::Country.all
    render json: @countries
  end

  def create
    @country = Api::V1::Country.new(country_params)
    @country.save
    render json: { message: 'Created' }
  end

  def remove
     @country = Api::V1::Country.find(params[:id])
     @country.delete
     render json: { message: 'Deleted' }
  end

  private
    def country_params
      params.require(:country).permit(:title, :country_code)
    end
end
