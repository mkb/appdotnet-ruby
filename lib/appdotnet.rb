require "appdotnet/version"
require 'appdotnet/user'
require 'appdotnet/token'
require 'appdotnet/post'

require 'yaml'
require 'excon'

DEFAULT_CONFIG_FILE_PATH = 'config/appdotnet.yml'

class AppDotNet
  attr_accessor :config_location
  attr_accessor :auth_url
  attr_accessor :access_token_url
  attr_accessor :client_id
  attr_accessor :client_secret
  attr_accessor :redirect_uri

  def initialize
    @config_location = DEFAULT_CONFIG_FILE_PATH
  end

  def read_config
    return YAML.load_file(config_location)
  end

  def configure
    configure_from_hash(read_config)
  end

  def configure_from_hash(hsh)
    @auth_url = hsh['auth_url']
    @access_token_url = hsh['access_token_url']
    @client_id = hsh['client_id']
    @client_secret = hsh['client_secret']
    @redirect_uri = hsh['redirect_uri']
  end

  def parameterized_url
    "https://alpha.app.net/oauth/authenticate?client_id=#{@client_id}&response_type=code&redirect_uri=#{@redirect_uri}&scope=stream+email+write_post+follow+messages+export"
  end

  def authentication_code
    r = Excon.get(parameterized_url)
    binding.pry
  end
end
