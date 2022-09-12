# require 'precursor'

require 'set'

require_relative '../lib/precursor'

override_vault = Precursor::ThreadLocalOverrideVault.new

config = Precursor.create do |builder|
  builder.vault override_vault

  builder.key :key_with_default do |key_builder|
    key_builder.default 42
  end
end

pp config[:key_with_default]

override_vault.override(:key_with_default, 99)

pp config[:key_with_default]

override_vault.clear(:key_with_default)

pp config[:key_with_default]
