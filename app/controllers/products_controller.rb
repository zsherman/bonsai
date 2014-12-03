class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_shopify, only: [:create]
  before_filter :admin_only, only: [:new, :create, :update, :destroy]
  #before_action :authenticate_admin!, :except => [:show, :index]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @classes = 'catalogue-page'
  end

  # GET /products/1
  # GET /products/1.json
  def show
    flash.notice = "All orders in December include a FREE sample of Ethiopian Yirgacheffe coffee!"
    @classes="box-page"
    render 'box'
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    authorize @product
  end

  # POST /products
  # POST /products.json
  def create
    # Find or initialize product with variant ID
    @product = Product.where(shopify_variant_id: product_params[:shopify_variant_id]).first_or_initialize

    # Delegate product & image requests to the model
    @product.resolve_shopify

    # if params[:ad_fields]
    #   params[:metadata].each do |key,value|
    #     @product.metadata[key.to_sym] = value
    #   end
    # end

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
    authorize @product
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
    authorize @product
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def set_shopify
      shop = ShopifyAPI::Shop.current
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :video_url, :price, :line_item_id, :shopify_variant_id, :shopify_product_id, :metadata, :instructor, :story_headline, :story_description, :instructor_description, :ingredient_ids => [])
    end
end
