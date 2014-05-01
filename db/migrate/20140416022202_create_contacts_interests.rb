class CreateContactsInterests < ActiveRecord::Migration
  def change
    create_table(:contacts_interests, :id => false) do |t|
      t.references :contact
      t.references :interest
    end
  end
end
