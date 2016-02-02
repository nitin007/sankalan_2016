module ApplicationHelper
  def events_collection
    Team::EVENTS.map{|e| [e.humanize.titleize, e] }
  end
end
