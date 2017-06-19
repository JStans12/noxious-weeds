require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(first_name: 'joey',
                        last_name: 'stansfield',
                        email: 'joey.stansfield@example.com',
                        password: 'password') }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :encrypted_password }

  it { should validate_uniqueness_of(:email).case_insensitive }
end
