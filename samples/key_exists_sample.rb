# frozen_string_literal: true

# require 'precursor'

require 'set'

require_relative '../lib/precursor'

config = Precursor.create do |builder|
  builder.vault Precursor::HashVault.new({ k: 123 })
end

pp config.key? :k
