class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|

      t.string :subject
      t.string :body
      t.boolean :is_sent, :default => false
      t.datetime :date_sent

      t.timestamps
    end
  end
end
