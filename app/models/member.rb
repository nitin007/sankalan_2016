class Member < ActiveRecord::Base
  GENDER = %w(male female)

  attr_accessible :name, :email, :contact_no, :gender, :accomodation_needed, :college

  validates_presence_of :name, :email, :gender

  validates_presence_of :contact_no, if: :accomodation_needed?

  validates_inclusion_of :gender, in: GENDER

  belongs_to :team, counter_cache: true

  def accomodation_required
    accomodation_needed? ? 'Yes' : 'No'
  end
end
