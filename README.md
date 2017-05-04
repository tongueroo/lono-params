# Lono Params

[![CircleCI](https://circleci.com/gh/tongueroo/lono-params.svg?style=svg)](https://circleci.com/gh/tongueroo/lono-params)

Tool to generate a CloudFormation params json formatted file from a simple env file.

Given:

```
Param1=1
# comments are fine
Param2=2 # comments can go after the line too
Param3=use_previous_value # treated specially
$
```

This is produced:

```json
[
  {
    "ParameterKey": "Param1",
    "ParameterValue": "1"
  },
  {
    "ParameterKey": "Param2",
    "ParameterValue": "2"
  },
  {
    "ParameterKey": "Param3",
    "UsePreviousValue": true
  }
]
```

## Installation

Add this line to your application's Gemfile:

    gem 'lono-params'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lono-params

## Usage

Create a directory under your project folder called `params`.  Create a env file at `params/my-stack.txt`.

To generate the CloudFormation json file that can be used with the `aws cloudformation create-stack` command, run:

```
$ lono-params generate my-stack
Params file generated for my-stack at ./output/params/my-stack.json
$
```

## More Help

```
$ bin/lono-params help
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
