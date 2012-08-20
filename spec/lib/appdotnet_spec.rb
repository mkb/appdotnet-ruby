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

  def test_configuration(adn, expected)
    adn.auth_url.should eq expected['auth_url']
    adn.access_token_url.should eq expected['access_token_url']
    adn.client_id.should eq expected['client_id']
    adn.client_secret.should eq expected['client_secret']
    adn.redirect_uri.should eq expected['redirect_uri']
  end

  context 'wihtout a test config' do
    before do
      tmpdir = Dir.tmpdir
      adn.stub(:config_location).and_return("#{tmpdir}/appdotnet.yml")
    end

    it 'allows configuration via string'
    it 'allows configuration via hash' do
      adn.configure_from_hash(TEST_CONFIG)
      test_configuration(adn, TEST_CONFIG)
    end


    it 'complains bitterly if we try to run without configuring'
  end

  context 'with test config' do
    before do
      tmpdir = Dir.tmpdir
      FileUtils.cp('./spec/support/appdotnet.yml', tmpdir)
      adn.stub(:config_location).and_return("#{tmpdir}/appdotnet.yml")
      adn.configure
    end

    describe '#read_config' do
      it 'reads yaml from config_location' do
        adn.read_config.should == TEST_CONFIG
      end
    end

    describe 'configure' do
      it 'reads the config' do
        test_configuration(adn, TEST_CONFIG)
      end
    end

    describe '#parameterized_url' do
      it 'returns the correct url' do
        adn.parameterized_url.should eq "https://alpha.app.net/oauth/authenticate?client_id=blahblahblahblah&response_type=code&redirect_uri=http://github.com/mkb/appdotnet-ruby&scope=stream+email+write_post+follow+messages+export"
      end
    end

    describe '#authentication_code' do
      it 'returns a code' do
        adn.authentication_code.should eq 'something'
      end
    end
  end
end
