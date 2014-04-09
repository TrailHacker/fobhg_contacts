class Contact < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Contact.create! row.to_hash
    end
    respond_to do |format|
      format.html { redirect_to import_path, :notice => "Successfully imported contacts." }
    end
  end
end
