class PlacesController < ApplicationController

  before_action :find_place, only: [:show]

  def index
    @places = Place.all
    @recomendation = Recomendation.new
  end

  def show
  end

  private

  def find_place
    @place = Place.find(params[:id])
  end
end
