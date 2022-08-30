class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    Team.create!(team_params)
    redirect_to '/teams'
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to "/teams/#{params[:id]}"
  end

  def delete
    team = Team.find(params[:id])
    team.delete_competitors
    team.destroy
    redirect_to '/teams'
  end

  private

  def team_params
    params.permit(:name, :head_coach, :year_founded, :is_brazilian)
  end
end
