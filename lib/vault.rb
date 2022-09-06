# frozen_string_literal

module Precursor
  # Base class for config vaults
  class Vault
    # Returns true if the vault has a value for the given key, otherwise false
    # @return [Boolean] true if the vault has a value for the given key, otherwise false
    def key?
      false
    end

    # Returns a value fot the given key, nil if key is not available
    # @return [Object|Nil] a value for the given key
    def value(key)
      nil
    end
  end
end
