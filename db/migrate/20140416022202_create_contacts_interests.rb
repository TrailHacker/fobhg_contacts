class CreateContactsInterests < ActiveRecord::Migration
  def change
    create_table :contacts_interests do |t|
      t.integer :contact_id
      t.integer :interest_id
    end
  end
end
