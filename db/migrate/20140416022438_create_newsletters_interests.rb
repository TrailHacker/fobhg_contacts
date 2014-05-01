class CreateNewslettersInterests < ActiveRecord::Migration
  def change
    create_table(:newsletters_interests, :id => false) do |t|
      t.integer :newsletter_id
      t.integer :interest_id
    end
  end
end
