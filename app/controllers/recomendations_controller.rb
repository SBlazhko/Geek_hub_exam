class RecomendationsController < ApplicationController

  def create
    recomendation = current_user.recomendations.new(recomendation_params)
    if recomendation.save
      flash[:notice] = "Recomendation successfuly add to place"
      redirect_to places_path
    else 
      flash[:alert] = "Recomendation not add to place"
      redirect_to places_path
    end
  end


  def tweet
    place = Place.find(params[:place_id])
    recomendation = Recomendation.find(params[:id])
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['tw_api_key']
      config.consumer_secret     = ENV['tw_api_secret']
      config.access_token        = current_user.token
      config.access_token_secret = current_user.token_secret
    end

    client.update("I leave recomendation \n #{recomendation.text}\n and give a mark #{recomendation.poit}!")
    redirect_to places_path
  end

  private 

  def recomendation_params
    params.require(:recomendation).permit(:text, :point).merge(place_id: params[:place_id])
  end

end
