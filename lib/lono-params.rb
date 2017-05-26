$:.unshift(File.expand_path("../", __FILE__))
require "lono_params/version"

require "json"
require "fileutils"
require 'plissken' # Hash#to_snake_keys

module LonoParams
  autoload :CLI, 'lono_params/cli'
  autoload :Generator, 'lono_params/generator'
end
