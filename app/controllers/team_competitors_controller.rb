class TeamCompetitorsController < ApplicationController
  def index
    @team = Team.find(params[:id])
    @competitors = @team.competitors
  end
end