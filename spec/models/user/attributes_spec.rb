require 'rails_helper'

describe User::Attributes do
  let(:user) { User.new }
  let(:attributes) { User::Attributes.new(user) }

  describe '#initialize' do
    it 'should save an user in an instance variable' do
      expect(User::Attributes.new(user).user).to be == user
    end
  end

  describe '#set_from_oauth' do
    before :each do
      @oauth = double
      allow(Devise).to receive_message_chain(:friendly_token, :[]).and_return('akhsbfdajwr')
      allow(@oauth).to receive_message_chain(:info, :email).and_return('email@example.com')
    end

    it 'should set the email' do
      expect(attributes.set_from_oauth(@oauth).email).to be == 'email@example.com'
    end

    it 'should return the user' do
      expect(attributes.set_from_oauth(@oauth)).to be == user
    end
  end
end
