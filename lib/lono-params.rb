$:.unshift(File.expand_path("../", __FILE__))
require "lono-params/version"

require "json"
require "fileutils"
require 'plissken' # Hash#to_snake_keys

module LonoParams
  autoload :CLI, 'lono-params/command'
  autoload :CLI, 'lono-params/cli'
  autoload :Generator, 'lono-params/generator'
end
