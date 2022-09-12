# frozen_string_literal: true

require_relative 'vault'

module Precursor
  class HashVault < Vault
    def initialize(hash)
      @store = hash
    end

    protected

    attr_reader :store
  end
end
