class TeamsController < ApplicationController
  before_filter :authenticate_any!
  before_filter :authorize_admin!, only: [:index]
  before_filter :fetch_team, except: [:index]

  def index
    @teams = Team.all
  end

  def show; end

  def edit; end

  def update
    if @team.update_attributes(params[:team])
      redirect_to @team, notice: 'You have successfully updated your team'
    else
      render :edit
    end
  end

  private

    def authorize_team!
      if current_team.id != params[:id].to_i
        flash[:alert] = "You are not authorized to access other team's details!"
        redirect_to team_path(current_team) and return
      end
    end

    def authorize_admin!
      unless admin_signed_in?
        flash[:alert] = "You are not authorized to access teams list!"
        redirect_to team_path(current_team)
      end
    end

    def fetch_team
      @team = Team.find(params[:id])
    end
end
