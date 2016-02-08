class Team < ActiveRecord::Base
  EVENTS = %w(all_events lan_gaming_only)
  MEMBERS_LIMIT = 6

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:team_name]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :team_name, :email, :password, :password_confirmation, :remember_me, :contact_no, :events, :captain_id

  validates_presence_of :email, :events

  validates :team_name,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }

  validates_format_of :team_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  validate :contact_no_format

  has_many :members
  belongs_to :captain, class_name: Member

  def get_status
    active? ? 'Active' : 'Inactive'
  end

  def to_param
    team_name
  end

  private

    def contact_no_format
      no = contact_no.to_i
      errors.add(:base, 'Contact no is invalid') if no < 7000000000 || no > 9999999999
    end
end
