class GarbagesController < ApplicationController
  before_action :authenticate, except: [:index]
  before_action :set_garbage, only: [:show, :edit, :update, :destroy]

  # GET /garbages
  # GET /garbages.json
  def index
    @garbages = Garbage.all
  end

  # GET /garbages/new
  def new
    @garbage = Garbage.new
  end

  # GET /garbages/1/edit
  def edit
  end

  # POST /garbages
  # POST /garbages.json
  def create
    @garbage = Garbage.new(garbage_params)

    respond_to do |format|
      if @garbage.save
        format.html { redirect_to garbages_path, notice: 'Lixo criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @garbage }
      else
        format.html { render action: 'new' }
        format.json { render json: @garbage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garbages/1
  # PATCH/PUT /garbages/1.json
  def update
    respond_to do |format|
      if @garbage.update(garbage_params)
        format.html { redirect_to garbages_path, notice: 'Lixo alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @garbage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garbages/1
  # DELETE /garbages/1.json
  def destroy
    @garbage.destroy
    respond_to do |format|
      format.html { redirect_to garbages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garbage
      @garbage = Garbage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garbage_params
      params.require(:garbage).permit(:name, :image)
    end
end
