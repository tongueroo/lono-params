module LonoParams
  class CLI < Thor
    class Help
      class << self
        def generate
<<-EOL
Example:

To generate a CloudFormation json file from parameters/my-stack.txt

$ lono-params generate my-stack

This will output a CloudFormation json file in output/parameters/my-stack.json
EOL
        end
      end
    end
  end
end