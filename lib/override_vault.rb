# frozen_string_literal: true

require_relative 'hash_vault'

module Precursor
  # Vault that stores data in hash and allows to override config on the fly
  class OverrideVault < HashVault
    def initialize(hash = {})
      super(hash)
    end

    def override(key, value)
      store[key] = value
    end

    def clear(key)
      store.delete(key)
    end
  end
end
