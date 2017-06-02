require 'thor'
require 'lono-params/command'
require 'lono-params/cli/help'

module LonoParams

  class CLI < Command
    class_option :verbose, type: :boolean
    class_option :noop, type: :boolean
    class_option :project_root, desc: "project root to use", default: '.'

    desc "generate NAME", "generate parameter json file for NAME"
    long_desc Help.generate
    option :path, desc: "Path of the source params txt file.  Use this to override the params/NAME.txt convention"
    def generate(name)
      Generator.new(name, options).generate
    end
  end
end
