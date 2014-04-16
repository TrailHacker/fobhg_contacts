class User < ActiveRecord::Base
  rolify
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates(:email, :presence => true,
            :format => { :with => email_regex },
            :uniqueness => { :case_sensitive => true })

end
