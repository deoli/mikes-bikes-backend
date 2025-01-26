class BlueprintProductsController < ApplicationController
  before_action :set_blueprint_product, only: %i[ show update destroy ]

  # GET /blueprint_products
  def index
    @blueprint_products = BlueprintProduct.all

    render json: @blueprint_products
  end

  # GET /blueprint_products/1
  def show
    render json: @blueprint_product
  end

  # POST /blueprint_products
  def create
    @blueprint_product = BlueprintProduct.new(blueprint_product_params)

    if @blueprint_product.save
      render json: @blueprint_product, status: :created, location: @blueprint_product
    else
      render json: @blueprint_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blueprint_products/1
  def update
    if @blueprint_product.update(blueprint_product_params)
      render json: @blueprint_product
    else
      render json: @blueprint_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blueprint_products/1
  def destroy
    @blueprint_product.destroy!
  end

  # OPTIONS /blueprint_products
  def options
    render json: [
      { key: "product_id", type: "ref#products" },
      { key: "parent_id", type: "ref#products" },
      { key: "blueprint_id", type: "ref#blueprints" }
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blueprint_product
      @blueprint_product = BlueprintProduct.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def blueprint_product_params
      params.expect(blueprint_product: [ :parent_id, :product_id, :blueprint_id ])
    end
end
