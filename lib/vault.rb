# frozen_string_literal: true

module Precursor
  # Base class for config vaults
  class Vault
    attr_reader :store

    # Loads vault data from the source
    # @param config_root [Precursor::ConfigRoot] A reference to config root to read values or resolve vars
    def load(config_root)
      @store = load_store(config_root)
    end

    # Returns true if the vault has a value for the given key, otherwise false
    # @return [Boolean] true if the vault has a value for the given key, otherwise false
    def key?(key)
      store.key?(key)
    end

    # Returns a value fot the given key, nil if key is not available
    # @return [Object|Nil] a value for the given key
    def value(key)
      store[key]
    end

    protected

    def load_store(_config_root)
      {}
    end
  end
end
