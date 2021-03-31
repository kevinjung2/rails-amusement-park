require 'pry'

class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @user = current_user
  end

  def new

  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    attraction = Attraction.find_by(id: params[:id])
    attraction.update(attraction_params)
    redirect_to attraction
  end


  private

    def attraction_params
      params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :min_height, :tickets)
    end

end
