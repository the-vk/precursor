# frozen_string_literal: true

# require 'precursor'

require_relative '../lib/precursor'

override_vault = Precursor::OverrideVault.new(priority: 1000)
override_vault.override(:key_with_default, 99)

config = Precursor.create do |builder|
  builder.key :key_with_default do |key_builder|
    key_builder.default 42
  end
end

pp config[:key_with_default] # 42

config.add_vault override_vault

pp config[:key_with_default] # 99

override_vault.clear(:key_with_default)

pp config[:key_with_default] # 42
