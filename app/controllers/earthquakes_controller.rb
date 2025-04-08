class EarthquakesController < ApplicationController
  before_action :set_earthquake, only: %i[show update destroy]

  # GET /earthquakes
  def index
    @earthquakes = Earthquake.page(params[:page]).per(20)
    render json: @earthquakes
  end

  # GET /earthquakes/1
  def show
    render json: @earthquake
  end

  # POST /earthquakes
  def create
    @earthquake = Earthquake.new(earthquake_params)

    if @earthquake.save
      render json: @earthquake, status: :created, location: @earthquake
    else
      render json: @earthquake.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /earthquakes/1
  def update
    if @earthquake.update(earthquake_params)
      render json: @earthquake
    else
      render json: @earthquake.errors, status: :unprocessable_entity
    end
  end

  # DELETE /earthquakes/1
  def destroy
    if @earthquake.destroy
      head :no_content
    else
      render json: { error: 'Failed to delete earthquake' }, status: :unprocessable_entity
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_earthquake
      @earthquake = Earthquake.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def earthquake_params
      params.require(:earthquake).permit(:date, :location, :magnitude, :depth)
    end
end
