require "json"
require "fileutils"
require 'plissken' # Hash#to_snake_keys

module LonoParams
  class Generator
    def initialize(name, options)
      @name = name
      @options = options
      @project_root = options[:project_root] || '.'
      @source_path = options[:path] || "#{@project_root}/params/#{@name}.txt"
    end

    def generate
      if File.exist?(@source_path)
        contents = IO.read(@source_path)
        data = convert_to_cfn_format(contents)
        json = JSON.pretty_generate(data)
        write_output(json)
        puts "Params file generated for #{@name} at #{output_path}"
      else
        puts "#{@source_path} could not be found?  Are you sure it exist?"
        exit 1
      end
    end

    # useful for when calling CloudFormation via the aws-sdk gem
    def params
      contents = IO.read(@source_path)
      convert_to_cfn_format(contents, :underscore)
    end

    def parse_contents(contents)
      lines = contents.split("\n")
      # filter out commented lines
      lines = lines.reject { |l| l =~ /(^|\s)#/i }
      # filter out empty lines
      lines = lines.reject { |l| l.strip.empty? }

      # looked into trying to remove the commnet at the end of the line but it looks like the reliably way to do that by breaking the line into a syntax tree?
      # http://stackoverflow.com/questions/5865371/ruby-regex-for-finding-comments
      # http://stackoverflow.com/questions/7330171/how-to-match-code-comment-with-regex-in-ruby
      lines
    end

    def convert_to_cfn_format(contents, casing=:camel)
      lines = parse_contents(contents)
      params = []
      lines.each do |line|
        key,value = line.strip.split("=").map {|x| x.strip}
        param = {
          "ParameterKey": key,
          "ParameterValue": value,
          "UsePreviousValue": @options[:use_previous_value]
        }
        param = param.to_snake_keys if casing == :underscore
        params << param
      end
      params
    end

    def output_path
      path = "#{@project_root}/output/params/#{@name}.json"
    end

    def write_output(json)
      dir = File.dirname(output_path)
      FileUtils.mkdir_p(dir) unless File.exist?(dir)
      IO.write(output_path, json)
    end

  end
end
