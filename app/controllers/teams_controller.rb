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
    Team.create!(name: params[:name],
                 head_coach: params[:head_coach],
                 year_founded: params[:year_founded],
                 is_brazilian: params[:is_brazilian])

    redirect_to '/teams'
  end

end