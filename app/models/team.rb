class Team < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:team_name]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :team_name, :email, :password, :password_confirmation, :remember_me

  validates :team_name,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }

  validates_format_of :team_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions.to_h).where(["lower(team_name) = :value", { :value => login }]).first
  #   else
  #     if conditions[:team_name].nil?
  #       where(conditions).first
  #     else
  #       where(team_name: conditions[:team_name]).first
  #     end
  #   end
  # end
end
