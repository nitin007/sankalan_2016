class AddMembersCountToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :members_count, :integer
  end
end
