class CompetitorsController < ApplicationController
  def index
    @competitors = Competitor.where(previous_winner: true)
  end

  def show
    @competitor = Competitor.find(params[:id])
  end

  def edit
    @competitor = Competitor.find(params[:id])
  end

  def update
    competitor = Competitor.find(params[:id])
    competitor.update(competitor_params)
    redirect_to "/competitors/#{params[:id]}"
  end

  def delete
    Competitor.find(params[:id]).delete
    redirect_to '/competitors'
  end

  private

  def competitor_params
    params.permit(:name, :weight_class, :previous_winner)
  end
end
