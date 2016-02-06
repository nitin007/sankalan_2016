class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :resource_signed_in?

  def after_sign_in_path_for(resource)
    case resource.class.to_s
    when "Team"
      team_path(resource)
    when "Admin"
      teams_path
    end
  end

  private

    def authenticate_any!
      redirect_to new_team_registration_url if !resource_signed_in?
    end

    def resource_signed_in?
      (team_signed_in? || admin_signed_in?)
    end
end
