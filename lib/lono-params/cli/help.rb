module LonoParams
  class CLI < Command
    class Help
      class << self
        def generate
<<-EOL
Example:

To generate a CloudFormation json file from params/my-stack.txt

$ lono-params generate my-stack

This will output a CloudFormation json file in output/params/my-stack.json
EOL
        end
      end
    end
  end
end
