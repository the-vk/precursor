# frozen_string_literal: true

# require 'precursor'

require 'set'

require_relative '../lib/precursor'

config_src = <<~YAML_CONFIG
  key1: abc
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
  builder.vault Precursor::YamlVault.new(config_src, priority: 0)
end

pp config[:key1]
pp config[:'key_a.abc']
pp config[:'key_a.def']
