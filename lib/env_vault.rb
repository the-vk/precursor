# frozen_string_literal: true

require_relative 'vault'

module Precursor
  # Vault that provides config values from environment variables
  class EnvVault < Vault
    # Initializes new instance of [EnvVault]
    # @param separator [String] separator for hierarchical config entries
    # @param allow_list [Array<String>] list of allowed env vars to prevent leaking of sensitive or unrelated vars
    def initialize(separator: '__', allow_list: [])
      @separator = '__'

      allow_set = Set.new(allow_list)

      @env_vars = ENV.select { |n, _| allow_set.empty? || allow_set.include?(n) }.to_h do |name, value|
        [name.sub(@separator, '.').to_sym, value]
      end
    end

    def key?(key)
      @env_vars.key? key
    end

    def value(key)
      @env_vars[key]
    end
  end
end
