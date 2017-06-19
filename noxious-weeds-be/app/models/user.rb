class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :encrypted_password

  validates_uniqueness_of :email
end