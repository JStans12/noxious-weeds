require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  shared_examples 'CRUD' do |role, model|
    context "role: #{role} model: #{model}" do
      it { expect(Ability.new(build(:user, roles: role))).to be_able_to(:create, model) }
      it { expect(Ability.new(build(:user, roles: role))).to be_able_to(:read, model) }
      it { expect(Ability.new(build(:user, roles: role))).to be_able_to(:update, model) }
      it { expect(Ability.new(build(:user, roles: role))).to be_able_to(:destroy, model) }
    end
  end

  shared_examples 'No access' do |role, model|
    context "Role #{role} with #{model}" do
      it { expect(Ability.new(build(:user, roles: role))).to_not be_able_to(:create, model) }
      it { expect(Ability.new(build(:user, roles: role))).to_not be_able_to(:read, model) }
      it { expect(Ability.new(build(:user, roles: role))).to_not be_able_to(:update, model) }
      it { expect(Ability.new(build(:user, roles: role))).to_not be_able_to(:destroy, model) }
    end
  end

  context 'logged out' do
    it_behaves_like 'No access', '', User
  end

  context 'admin' do
    it_behaves_like 'CRUD', 'admin', User
  end
end
