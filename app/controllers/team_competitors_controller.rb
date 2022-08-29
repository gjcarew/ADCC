class TeamCompetitorsController < ApplicationController
  def index
    @team = Team.find(params[:id])
    @competitors = @team.competitors
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
    params.permit(:name, :weight_class, :previous_winner)
  end
end