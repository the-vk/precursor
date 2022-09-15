# frozen_string_literal: true

require_relative 'config_key_builder'
require_relative 'config_root'

module Precursor
  # A builder to set up Precurcor
  class ConfigRootBuilder
    def initialize
      @vaults = []
      @key_builders = {}
    end

    def vault(vault)
      @vaults.push(vault)
    end

    def key(key_name)
      builder = ConfigKeyBuilder.new
      @key_builders[key_name] = builder
      yield builder
    end

    def build
      key_options = @key_builders.transform_values(&:build)
      ConfigRoot.new(@vaults, key_options)
    end
  end
end
