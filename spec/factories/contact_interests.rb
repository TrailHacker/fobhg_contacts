# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_interest, :class => 'ContactInterests' do
    contact_id 1
    interest_id 1
  end
end
