class Newsletter < ActiveRecord::Base
  has_and_belongs_to_many :interests, :join_table => "newsletters_interests"
  has_many :contacts, :through => :interests
  accepts_nested_attributes_for :interests
end
