# LonoParams

Tool to generate a CloudFormation params json formatted file from a simplier env like file.

Given:

```
Param1=1
Param2=1
```

This is produced:

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

## Installation

Add this line to your application's Gemfile:

    gem 'lono-params'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lono-params

## Usage

Create a directory under your project folder called `params`.  Then given, a file with params in a simple list format:

```
$ cat params/my-stack.txt
# comments are fine
Param1=1
Param2=2 # comments can go after the line too
Param2=use_previous_value # treated specially
$
```

Generate the CloudFormation json file that can be used with the `aws cloudformation create-stack` command.

```
$ lono-params generate my-stack
Params file generated for my-stack at ./params/my-stack.json
$
```

This is what the `output/params/my-stack.json` file looks like:

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
    "ParameterKey": "Param2",
    "UsePreviousValue": true
  }
]
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
