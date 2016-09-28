$:.unshift(File.expand_path("../", __FILE__))
require "lono_params/version"

module LonoParams
  autoload :CLI, 'lono_params/cli'
end