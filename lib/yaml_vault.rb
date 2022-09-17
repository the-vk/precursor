# frozen_string_literal: true

require 'yaml'

require_relative 'vault'

module Precursor
  # Vault that reads config data from a string with Yaml
  class YamlVault < Vault
    def initialize(yaml)
      super()
      @yaml = yaml
    end

    protected

    def load_store(_config_root)
      flat_hash(YAML.safe_load(@yaml))
    end

    private

    def flat_hash(hash, prefix = nil)
      flat_hash = hash.flat_map do |k, v|
        k = "#{prefix}.#{k}" unless prefix.nil?
        if v.is_a? Hash
          flat_hash(v, k)
        else
          { k => v }
        end
      end
      flat_hash.reduce(:merge).transform_keys(&:to_sym)
    end
  end
end
