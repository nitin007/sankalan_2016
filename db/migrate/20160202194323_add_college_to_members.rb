class AddCollegeToMembers < ActiveRecord::Migration
  def change
    add_column :members, :college, :string
  end
end
