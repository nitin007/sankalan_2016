class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.boolean :status, default: false
      t.integer :captain_id

      t.timestamps
    end
  end
end
