class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|

      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.string :email_address

      t.string :invitation_token
      t.integer :owner_id
      t.boolean :wants_emails, :default => true

      t.timestamps
    end
  end
end
