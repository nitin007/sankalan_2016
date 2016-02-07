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
  after_create :activate_team, :assign_captain
  after_destroy :deactivate_team


  def accomodation_required
    accomodation_needed? ? 'Yes' : 'No'
  end

  private

    def assign_captain
      team.update_attribute(:captain_id, self.id) if(team.members.count == 1)
    end

    def activate_team
      team.update_attribute(:active, true) if(team.members.count >= 3)
    end

    def deactivate_team
      team.update_attribute(:active, false) if(team.members.count <= 2)
    end

    def members_limit
      errors.add(:base, 'There can be maximum 6 members in a team!') if team.members_count >= 6
    end
end
