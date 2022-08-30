class TeamCompetitorsController < ApplicationController
  def index
    @team = Team.find(params[:id])
    if params[:sort_alphabetically].nil?
      @competitors = @team.competitors
    else
      @competitors = @team.competitors.order("name")
    end
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    team = Team.find(params[:id])

    team.competitors.create!(team_competitors_params)
    redirect_to "/teams/#{params[:id]}/competitors"
  end

  private

  def team_competitors_params
    params.permit(:name, :weight_class, :previous_winner, :sort)
  end
end