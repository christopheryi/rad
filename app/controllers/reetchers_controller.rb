class ReetchersController < ApplicationController
  before_action :set_reetcher, only: [:show, :edit, :update, :destroy]
  before_filter :zero_authors_or_authenticated, only: [:new, :create]
  before_filter :require_login, except: [:new, :create]

  def zero_authors_or_authenticated
    unless Reetcher.count == 0 || current_user
      redirect_to root_path
      return false
    end
  end

  # GET /reetchers
  # GET /reetchers.json
  def index
    @reetchers = Reetcher.all
  end

  # GET /reetchers/1
  # GET /reetchers/1.json
  def show
  end

  # GET /reetchers/new
  def new
    @reetcher = Reetcher.new
  end

  # GET /reetchers/1/edit
  def edit
  end

  # POST /reetchers
  # POST /reetchers.json
  def create
    @reetcher = Reetcher.new(reetcher_params)

    respond_to do |format|
      if @reetcher.save
        format.html { redirect_to @reetcher, notice: 'Reetcher was successfully created.' }
        format.json { render :show, status: :created, location: @reetcher }
      else
        format.html { render :new }
        format.json { render json: @reetcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reetchers/1
  # PATCH/PUT /reetchers/1.json
  def update
    respond_to do |format|
      if @reetcher.update(reetcher_params)
        format.html { redirect_to @reetcher, notice: 'Reetcher was successfully updated.' }
        format.json { render :show, status: :ok, location: @reetcher }
      else
        format.html { render :edit }
        format.json { render json: @reetcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reetchers/1
  # DELETE /reetchers/1.json
  def destroy
    @reetcher.destroy
    respond_to do |format|
      format.html { redirect_to reetchers_url, notice: 'Reetcher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reetcher
      @reetcher = Reetcher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reetcher_params
      params.require(:reetcher).permit(:username, :email, :password, :password_confirmation)
    end
end
