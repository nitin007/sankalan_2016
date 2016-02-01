class AddUsernameToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :team_name, :string
    add_index :teams, :team_name, :unique => true
  end
end
