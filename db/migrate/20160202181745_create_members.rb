class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :contact_no
      t.string :gender
      t.boolean :accomodation_needed, default: false
      t.references :team

      t.timestamps
    end
  end
end
