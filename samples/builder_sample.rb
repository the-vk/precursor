# frozen_string_literal: true

# require 'precursor'

require 'set'

require_relative '../lib/precursor'

config = Precursor.create do |builder|
  builder.vault Precursor::EnvVault.new(allow_list: ['config__test'])

  builder.key :key_with_default do |key_builder|
    key_builder.default 42
  end
end

pp config[:'config.test']
pp config[:key_with_default]
