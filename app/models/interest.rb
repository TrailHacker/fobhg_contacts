class Interest < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :newsletters, :join_table => "newsletters_interests"
end
