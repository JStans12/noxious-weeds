class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :encrypted_password

  validates_uniqueness_of :email

  def roles_list
    roles.split(' ')
  end

  def has_role?(role)
    roles_list.include?(role)
  end
end
