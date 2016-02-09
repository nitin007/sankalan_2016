class ChangeContactNoColumnToBigint < ActiveRecord::Migration
  def change
    change_column :teams, :contact_no, :bigint
  end
end
