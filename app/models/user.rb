# User model
class User < ApplicationRecord
  has_many :weathers
  has_secure_password

  validates_uniqueness_of :login
end
