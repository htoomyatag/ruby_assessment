class GeneresController < ApplicationController
  before_action :set_genere, only: %i[ show edit update destroy ]

  # GET /generes or /generes.json
  def index
    @generes = Genere.all
  end

  # GET /generes/1 or /generes/1.json
  def show
  end

  # GET /generes/new
  def new
    @genere = Genere.new
  end

  # GET /generes/1/edit
  def edit
  end

  # POST /generes or /generes.json
  def create
    @genere = Genere.new(genere_params)

    respond_to do |format|
      if @genere.save
        format.html { redirect_to genere_url(@genere), notice: "Genere was successfully created." }
        format.json { render :show, status: :created, location: @genere }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @genere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generes/1 or /generes/1.json
  def update
    respond_to do |format|
      if @genere.update(genere_params)
        format.html { redirect_to genere_url(@genere), notice: "Genere was successfully updated." }
        format.json { render :show, status: :ok, location: @genere }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @genere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generes/1 or /generes/1.json
  def destroy
    @genere.destroy

    respond_to do |format|
      format.html { redirect_to generes_url, notice: "Genere was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genere
      @genere = Genere.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genere_params
      params.require(:genere).permit(:title)
    end
end
