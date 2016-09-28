# LonoParams

[![Build Status](https://magnum.travis-ci.com/)](https://magnum.travis-ci.com/)
[![Code Climate](https://codeclimate.com/)](https://codeclimate.com/)
[![Code Climate](https://codeclimate.com/)](https://codeclimate.com/)

Tool to generate a CloudFormation parameters json formatted file

## Installation

Add this line to your application's Gemfile:

    gem 'lono-params'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lono-params

## Usage

Create a directory under your project folder called `parameters`.  Then given, a file with parameters in a simple list format:

```
$ cat parameters/my-stack.txt 
Param1=1
Param2=1
$ 
```

Generate the CloudFormation json file that can be used with the `aws cloudformation create-stack` command.

```
$ lono-params generate my-stack
Params file generated for my-stack at ./parameters/my-stack.json
$ 
```

This is what the `output/parameters/my-stack.json` file looks like:

```json
[
  {
    "ParameterKey": "Param1",
    "ParameterValue": "1",
    "UsePreviousValue": true
  },
  {
    "ParameterKey": "Param2",
    "ParameterValue": "1",
    "UsePreviousValue": true
  }
]
```


## More Help


<pre>
$ bin/lono-params help
Commands:
  lono-params generate NAME   # generate parameter json file for NAME
  lono-params help [COMMAND]  # Describe available commands or one specific command

Options:
  [--verbose], [--no-verbose]    
  [--noop], [--no-noop]          
  [--project-root=PROJECT_ROOT]  # project root to use
                                 # Default: .

$ lono-params help generate
/Users/tung/src/gitresolve/infra/lono/vendor/gems/lono-params/bin
Usage:
  lono-params generate NAME

Options:
  [--use-previous-value], [--no-use-previous-value]  
                                                     # Default: true
  [--verbose], [--no-verbose]                        
  [--noop], [--no-noop]                              
  [--project-root=PROJECT_ROOT]                      # project root to use
                                                     # Default: .

Description:
  Example:

  To generate a CloudFormation json file from parameters/my-stack.txt

  $ lono-params generate my-stack

  This will output a CloudFormation json file in output/parameters/my-stack.json
$ 
</pre>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request