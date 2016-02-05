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
end
