class SetDefaultValueMembersCount < ActiveRecord::Migration
  def change
    Team.where(members_count: nil).update_all(members_count: 0)
    change_column_default(:teams, :members_count, 0)
  end
end
