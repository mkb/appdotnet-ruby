require 'spec_helper'
require 'tmpdir'

TEST_CONFIG = {
  'auth_url' => 'https://alpha.app.net/oauth/authenticate',
  'access_token_url' => 'https://alpha.app.net/oauth/access_token',
  'client_id' => 'blahblahblahblah',
  'client_secret' => 'hualguhalghalghalghaglhaglgagg',
  'redirect_uri' => 'http://github.com/mkb/appdotnet-ruby'
}

describe AppDotNet do
  let(:adn) { AppDotNet.new }

  context 'wihtout a test config' do
    before do
      tmpdir = Dir.tmpdir
      store.stub(:config_location).and_return("#{tmpdir}/appdotnet.yml")
    end

    it 'allows configuration via string'
    it 'allows configuration via hash'
    it 'complains bitterly if we try to run without configuring'
  end


  context 'with test config' do
    before do
      tmpdir = Dir.tmpdir
      FileUtils.cp('./spec/support/appdotnet.yml', tmpdir)
      adn.stub(:config_location).and_return("#{tmpdir}/appdotnet.yml")
    end

    describe '#read_config' do
      it 'reads yaml from config_location' do
        adn.read_config.should == TEST_CONFIG
      end
    end
  end
end

