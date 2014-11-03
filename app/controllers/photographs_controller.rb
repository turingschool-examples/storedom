class PhotographsController < ApplicationController
  before_action :set_photograph, only: [:show, :edit, :update, :destroy]

  # GET /photographs
  # GET /photographs.json
  def index
    @photographs = Photograph.all
  end

  # GET /photographs/1
  # GET /photographs/1.json
  def show
  end

  # GET /photographs/new
  def new
    @photograph = Photograph.new
  end

  # GET /photographs/1/edit
  def edit
  end

  # POST /photographs
  # POST /photographs.json
  def create
    @photograph = Photograph.new(photograph_params)

    respond_to do |format|
      if @photograph.save
        format.html { redirect_to @photograph, notice: 'Photograph was successfully created.' }
        format.json { render :show, status: :created, location: @photograph }
      else
        format.html { render :new }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photographs/1
  # PATCH/PUT /photographs/1.json
  def update
    respond_to do |format|
      if @photograph.update(photograph_params)
        format.html { redirect_to @photograph, notice: 'Photograph was successfully updated.' }
        format.json { render :show, status: :ok, location: @photograph }
      else
        format.html { render :edit }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photographs/1
  # DELETE /photographs/1.json
  def destroy
    @photograph.destroy
    respond_to do |format|
      format.html { redirect_to photographs_url, notice: 'Photograph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photograph
      @photograph = Photograph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photograph_params
      params.require(:photograph).permit(:url, :photographable_id, :photographable_type)
    end
end
