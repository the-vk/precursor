# frozen_string_literal: true

require_relative 'vault'

module Precursor
  class OverrideVault < Vault
    def initialize
      @vault_data = {}
    end

    def override(key, value)
      store[key] = value
    end

    def clear(key)
      store.delete(key)
    end

    protected

    def store
      @vault_data
    end
  end
end
