class Contact < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      puts row.to_hash
      Contact.create! row.to_hash
    end
  end
end
