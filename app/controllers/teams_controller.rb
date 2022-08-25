class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def competitors
    @team = Team.find(params[:id])
    @competitors = Competitor.where(team_id: @team.id)
  end

end