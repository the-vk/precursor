# frozen_string_literal: true

require_relative 'vault'

module Precursor
  # Vault that reads config data from passed hash
  class HashVault < Vault
    def initialize(hash)
      super()
      @store = hash
    end

    protected

    def load_store(_config_root)
      @store
    end
  end
end
