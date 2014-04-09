require 'spec_helper'

describe Contact do
  csv_rows = <<-eos
first_name, last_name, email_address
lucas, hardbarger, lucas@hardbarger.com
jennifer, hardbarger, jenniferhardbarger@gmail.com
  eos
  file = TempFile.new('updated_contacts.csv')
  file.write csv_rows
  file.rewind

  assert_differences "Contact.count", 2 do
    post :contacts_import, :file => Rack::Test::UploadedFile.new(file, 'text/csv')
  end
  assert_redirected_to :contacts_import
  assert_equal "Successfully imported contacts!", flash["notice"]
end
