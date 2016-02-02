class Member < ActiveRecord::Base
  attr_accessible :name, :email, :contact_no, :gender, :accomodation_needed, :team_id

  validates_presence_of :name, :email, :gender

  validates_presence_of :contact_no, if: :accomodation_needed?

  belongs_to :team, counter_cache: true

  def accomodation_required
    accomodation_needed? ? 'Yes' : 'No'
  end
end
