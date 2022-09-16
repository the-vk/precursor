# frozen_string_literal: true

require_relative 'vault'

module Precursor
  # Vault that reads config data from passed hash
  class HashVault < Vault
    def initialize(hash, priority:)
      super(priority: priority)
      @store = hash
    end

    protected

    attr_reader :store
  end
end
