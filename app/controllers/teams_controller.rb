class TeamsController < ApplicationController
  before_filter :authenticate_any!
  before_filter :fetch_team, except: [:index]
  before_filter :authorize_admin!

  def index
    @teams = Team.all
  end

  def show; end

  def change_captain
    if params[:team] && @team.update_attributes(captain_id: params[:team][:captain_id])
      flash[:notice] = 'You have successfully updated your captain'
    else
      flash[:alert] = params[:team] ? @team.errors.full_messages.to_sentence : "You didn't select any captain!"
    end
    redirect_to @team
  end

  private

    def authorize_admin!
      if !admin_signed_in? && accessing_other_team_info?
        flash[:alert] = "You are not authorized to access other team's info!"
        redirect_to team_path(current_team)
      end
    end

    def accessing_other_team_info?
      current_team.id != @team.try(:id)
    end

    def fetch_team
      @team = Team.find_by_team_name(params[:id])
    end
end
