class CreateContactInterests < ActiveRecord::Migration
  def change
    create_table :contact_interests do |t|
      t.integer :contact_id
      t.integer :interest_id

      t.timestamps
    end
  end
end
