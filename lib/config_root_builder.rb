# frozen_string_literal: true

require_relative 'config_root'

module Precursor
  class ConfigRootBuilder
    def initialize
      @vaults = []
    end

    def vault(vault)
      @vaults.push(vault)
    end

    def build
      ConfigRoot.new(@vaults)
    end
  end
end
