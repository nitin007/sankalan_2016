class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.boolean :status
      t.integer :captain_id

      t.timestamps
    end
  end
end
