class HomeController < ApplicationController
  def index
    render json: { message: "Welcome to the Earthquake API. Visit /earthquakes to get data." }
  end
end
