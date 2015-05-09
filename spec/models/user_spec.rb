require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }

  context 'model validations' do
    it 'is return a valid user' do
      expect(user).to be_valid
    end
  end
end
