require 'spec_helper'

describe AppDotNet::User do
  let(:adn) { AppDotNet.new }

  before do
    adn.configure
  end

  describe '.get' do
    it 'retrieves a user' do
      u = AppDotNet::User.get(123)
      u.should be_instance_of User
    end
  end

  describe '#follow' do
  end

  describe '#unfollow' do
  end

  describe '#following' do
  end

  describe '#followers' do
  end

  describe '#mute' do
  end

  describe '#unmute' do
  end

  describe '#muted' do
  end
end


