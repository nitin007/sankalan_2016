class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.includes(:members).where(id: params[:id]).last
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      redirect_to @team, notice: 'You have successfully updated your team'
    else
      render :edit
    end
  end
end
