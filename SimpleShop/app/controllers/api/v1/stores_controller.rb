class Api::V1::StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admins?
  skip_before_action :verify_authenticity_token

  def index
    @stores = Api::V1::Store.all
    render json: @stores
  end

  def create
    @store = Api::V1::Store.new(store_params)
    @store.save
    render json: { message: 'Created' }
  end

  def remove
     @stores = Api::V1::Store.find(params[:id])
     @stores.delete
     render json: { message: 'Removed' }
  end

  private
    def store_params
      params.require(:store).permit(:title, :region_id)
    end
end
