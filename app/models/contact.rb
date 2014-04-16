class Contact < ActiveRecord::Base
  has_and_belongs_to_many :interests, :join_table => "contacts_interests"
  has_many :newsletters, :through => :interests

  def self.import(file)
    # Look at this:
    #   http://railscasts.com/episodes/396-importing-csv-and-excel
    #   http://csv-mapper.rubyforge.org/
    CSV.foreach(file.path, headers: true) do |row|
      puts row.to_hash
      Contact.create! row.to_hash
    end
  end
end
