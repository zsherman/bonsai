class UnlockCodesController < ApplicationController
  before_action :set_unlock_code, only: [:show, :edit, :update, :destroy]

  # GET /unlock_codes
  # GET /unlock_codes.json
  def index
    @unlock_codes = UnlockCode.all
  end

  # GET /unlock_codes/1
  # GET /unlock_codes/1.json
  def show
  end

  # GET /unlock_codes/new
  def new
    @unlock_code = UnlockCode.new
  end

  # GET /unlock_codes/1/edit
  def edit
  end

  def unlock
  end

  def validate_code
    code = params[:code][:unlock_code]
    unlock_code = UnlockCode.where(code: code).first
    if unlock_code.blank?
      redirect_to products_path, notice: "Sorry. #{code} is invalid."
    else
      unlock_code.user_id = current_user.id
      unlock_code.used = true
      unlock_code.save!
      # redirect to the product's course
      redirect_to product_path(unlock_code.product), success: "Got the code. #{code}"
    end
  end

  # POST /unlock_codes
  # POST /unlock_codes.json
  def create
    @unlock_code = UnlockCode.new(unlock_code_params)

    respond_to do |format|
      if @unlock_code.save
        format.html { redirect_to @unlock_code, notice: 'Unlock code was successfully created.' }
        format.json { render :show, status: :created, location: @unlock_code }
      else
        format.html { render :new }
        format.json { render json: @unlock_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unlock_codes/1
  # PATCH/PUT /unlock_codes/1.json
  def update
    respond_to do |format|
      if @unlock_code.update(unlock_code_params)
        format.html { redirect_to @unlock_code, notice: 'Unlock code was successfully updated.' }
        format.json { render :show, status: :ok, location: @unlock_code }
      else
        format.html { render :edit }
        format.json { render json: @unlock_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unlock_codes/1
  # DELETE /unlock_codes/1.json
  def destroy
    @unlock_code.destroy
    respond_to do |format|
      format.html { redirect_to unlock_codes_url, notice: 'Unlock code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unlock_code
      @unlock_code = UnlockCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unlock_code_params
      params.require(:unlock_code).permit(:code, :unlock_code)
    end
end
