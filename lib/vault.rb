# frozen_string_literal: true

module Precursor
  # Base class for config vaults
  class Vault
    # Priority of the vault. Vaults with higher priority are checked first when looking for config value
    attr_reader :priority

    # Initializes new instance of [Precursor::Vault]
    # @param priority [Integer] the vault priority
    def initialize(priority:)
      @priority = priority
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

    # Replace this method in descendant classes to return Hash-like store
    def store
      {}
    end
  end
end
