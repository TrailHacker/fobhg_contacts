class Contact < ActiveRecord::Base
  has_and_belongs_to_many :interests, :join_table => "contacts_interests"
  has_many :newsletters, :through => :interests
  accepts_nested_attributes_for :interests

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      puts row.to_hash
      Contact.create! row.to_hash
    end
  end
end
