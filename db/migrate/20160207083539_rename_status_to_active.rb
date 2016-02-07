class RenameStatusToActive < ActiveRecord::Migration
  def up
    rename_column :teams, :status, :active
  end

  def down
    rename_column :teams, :active, :status
  end
end
