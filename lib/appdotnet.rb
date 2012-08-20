require "appdotnet/version"
require 'appdotnet/user'
require 'appdotnet/token'
require 'appdotnet/post'

require 'yaml'

DEFAULT_CONFIG_FILE_PATH = 'config/appdotnet.yml'

class AppDotNet
  attr_accessor :config_location

  def initialize
    @config_location = DEFAULT_CONFIG_FILE_PATH
  end

  def read_config
    YAML.load_file(config_location)
  end
end
