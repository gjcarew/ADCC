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

  def team_params
    params.permit(:name, :head_coach, :year_founded, :is_brazilian)
  end

end