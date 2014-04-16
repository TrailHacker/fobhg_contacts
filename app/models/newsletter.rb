class Newsletter < ActiveRecord::Base
  has_and_belongs_to_many :interests
  has_many :contacts, :through => :interests
end
