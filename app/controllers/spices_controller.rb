class SpicesController < ApplicationController
  # rescue_from ActionController::RoutingError, with: :render_not_found_response
  wrap_parameters format: []

  def index
    spices = Spice.all
    render json: spices, status: :ok
  end

  def show
    spice = find_spice
    render json: spice, status: :ok
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice, status: :ok
  end

  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end

  private

  def find_spice
    Spice.find(params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def render_not_found_response
    render json: { error: "Spice not found" }, status: :not_found
  end
end
