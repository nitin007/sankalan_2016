module ApplicationHelper
  def events_collection
    Team::EVENTS.map{|e| [e.humanize.titleize, e] }
  end

  def gender_collection
    [['Male', 'male'], ['Female', 'female']]
  end

  def accomodation_options
    [['Yes', true], ['No', false]]
  end

  def logout_path
    team_signed_in? ? destroy_session_path(current_team) : destroy_session_path(current_admin)
  end
end
