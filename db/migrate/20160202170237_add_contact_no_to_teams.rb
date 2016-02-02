class AddContactNoToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :contact_no, :string
  end
end
