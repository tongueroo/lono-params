require 'thor'
require 'lono_params/cli/help'

module LonoParams

  class CLI < Thor
    class_option :verbose, type: :boolean
    class_option :noop, type: :boolean
    class_option :project_root, desc: "project root to use", default: '.'

    desc "generate NAME", "generate parameter json file for NAME"
    long_desc Help.generate
    option :use_previous_value, type: :boolean, default: true
    def generate(name)
      Generator.new(name, options).generate
    end
  end
end
