# require 'precursor'

require 'set'

require_relative '../lib/precursor'

config_src = <<~YAML_CONFIG
  key_1: abc
  key_a:
    abc: 123
    def: 234
  arr:
      - abc: a
        def: b
      - abc: 1
        def: 2
YAML_CONFIG

config = Precursor.create do |builder|
  builder.vault Precursor::YamlVault.new(config_src)
end

pp config[:key_1]
pp config[:'key_a.abc']
pp config[:'key_a.def']
