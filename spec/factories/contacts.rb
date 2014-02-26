# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name "MyString"
    last_name "MyString"
    company_name "MyString"
    street_address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    phone_number "MyString"
    email_address "MyString"
  end
end
