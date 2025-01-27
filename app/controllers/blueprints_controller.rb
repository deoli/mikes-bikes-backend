class BlueprintsController < ApplicationController
  before_action :set_blueprint, only: %i[ show update destroy ]

  # GET /blueprints
  def index
    @blueprints = Blueprint.all

    render json: @blueprints
  end

  # GET /blueprints/1
  def show
    render json: @blueprint
  end

  # POST /blueprints
  def create
    @blueprint = Blueprint.new(blueprint_params)

    if @blueprint.save
      render json: @blueprint, status: :created, location: @blueprint
    else
      render json: @blueprint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blueprints/1
  def update
    if @blueprint.update(blueprint_params)
      render json: @blueprint
    else
      render json: @blueprint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blueprints/1
  def destroy
    @blueprint.destroy!
  end

  # OPTIONS /blueprints
  def options
    render json: [
      { key: "name", type: "string" },
      { key: "parent_id", type: "ref#blueprints" },
      { key: "is_optional", type: "boolean" },
      { key: "is_attribute", type: "boolean" }
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blueprint
      @blueprint = Blueprint.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def blueprint_params
      params.expect(blueprint: [ :parent_id, :name, :is_optional, :is_attribute ])
    end
end
