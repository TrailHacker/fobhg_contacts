# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name "First Name"
    last_name "Last Name"
    company_name "Company Name"
    street_address "123 North St."
    city "Newark"
    state "OH"
    zip "43055"
    phone_number "(555) 555-5555"
    email_address "test@email.com"
  end
end
