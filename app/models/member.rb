class Member < ActiveRecord::Base
  GENDER = %w(male female)

  attr_accessible :name, :email, :contact_no, :gender, :accomodation_needed, :college

  validates_presence_of :name, :email, :gender

  validates_uniqueness_of :email, case_sensitive: false
  validates_uniqueness_of :contact_no, allow_blank: true

  validates_presence_of :contact_no, if: :accomodation_needed?

  validates_inclusion_of :gender, in: GENDER

  belongs_to :team, counter_cache: true

  validate :members_limit
  after_create :activate_team
  after_destroy :deactivate_team

  def to_param
    team_name
  end

  def accomodation_required
    accomodation_needed? ? 'Yes' : 'No'
  end

  private

    def activate_team
      team.update_attribute(:active, true) if(team.members_count >= 3)
    end

    def deactivate_team
      team.update_attribute(:active, false) if(team.members.count <= 2)
    end

    def members_limit
      errors.add(:base, 'There can be maximum 6 members in a team!') if team.members_count >= 6
    end
end
