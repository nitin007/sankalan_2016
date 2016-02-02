class AddEventsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :events, :string
  end
end
