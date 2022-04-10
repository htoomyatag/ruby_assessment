class Api::V1::RegionsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admins?
  skip_before_action :verify_authenticity_token

  def index
    @regions = Api::V1::Region.all
    render json: @regions
  end

  def create
    @region = Api::V1::Region.new(region_params)
    @region.save
    render json: { message: 'Created' }
  end

  def remove
     @regions = Api::V1::Region.find(params[:id])
     @regions.delete
    render json: { message: 'Removed' }
  end

  private
    def region_params
      params.require(:region).permit(:title, :country_id, :currency_id, :tax_id)
    end
end
