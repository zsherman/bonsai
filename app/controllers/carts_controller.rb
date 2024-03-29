class CartsController < ApplicationController
  before_action :set_cart, only: [:edit, :update, :destroy]
  #rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    # Todo: lock down carts/:id
    @cart = current_cart
    @shopify_cart_url = @cart.build_cart_url(current_user, current_cart)
    respond_to do |format|
      format.html
      format.json { render json: @cart }
    end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = current_cart
    respond_to do |format|
      if @cart.save
        format.html { redirect_to current_cart_path, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to current_cart_path, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to current_cart_path, notice: 'Cart was successfully emptied.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart, :product_id, :line_items]
    end

    def record_not_found
      redirect_to products_path, :notice => 'Invalid cart'
    end
end
