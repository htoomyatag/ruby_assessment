class Api::V1::ContentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_content, only: %i[ show edit update destroy ]

  # GET /contents or /contents.json
  def index
  
    @contents = Content.select(:id,:title, :published_date, :author, :summary, :content).where(:status  => 'published')
    render json: @contents.to_json

  end
  
  def create
    @content = Content.new(content_params)
    @content.save
    render status: 200, json: @content.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:title, :published_date, :author, :summary, :content, :status)
    end
end
