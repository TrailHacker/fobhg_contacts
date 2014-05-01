class CreateNewslettersInterests < ActiveRecord::Migration
  def change
    create_table(:newsletters_interests, :id => false) do |t|
      t.references :newsletter
      t.references :interest
    end
  end
end
