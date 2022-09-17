# frozen_string_literal: true

require_relative 'vault'

module Precursor
  # Vault that provides config values from environment variables
  class EnvVault < Vault
    # Initializes new instance of [EnvVault]
    # @param separator [String] separator for hierarchical config entries
    # @param allow_list [Array<String>] list of allowed env vars to prevent leaking of sensitive or unrelated vars
    def initialize(separator: '__', allow_list: [])
      super()
      @separator = separator

      @allow_set = Set.new(allow_list)
    end

    protected

    def load_store(_config_root)
      ENV.select { |n, _| @allow_set.empty? || @allow_set.include?(n) }.transform_keys do |name|
        name.sub(@separator, '.').to_sym
      end
    end
  end
end
