class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_shopify, only: [:create]
  #before_action :authenticate_admin!, :except => [:show, :index]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.where(shopify_variant_id: product_params[:shopify_variant_id]).first_or_initialize

    # Grab shopify variant and parent product
    shopify_variant = ShopifyAPI::Variant.find(@product.shopify_variant_id)
    shopify_product = ShopifyAPI::Product.find(shopify_variant.product_id)

    # Merge shopify attrs into this model
    @product.title = shopify_variant.title
    @product.price = shopify_variant.price
    @product.shopify_product_id = shopify_variant.product_id

    # Create image models for each shopify image
    shopify_product.images.each do |img|
      image = Image.where(shopify_id: img.id).first_or_initialize
      image.shopify_url = img.src
      image.product_id = @product.id
      image.save
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_shopify
      shop = ShopifyAPI::Shop.current
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :video_url, :price, :line_item_id, :shopify_variant_id, :shopify_product_id)
    end
end
