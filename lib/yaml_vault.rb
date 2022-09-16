# frozen_string_literal: true

require 'yaml'

require_relative 'vault'

module Precursor
  # Vault that reads config data from a string with Yaml
  class YamlVault < Vault
    def initialize(src, priority:)
      super(priority: priority)
      @yaml = flat_hash(YAML.safe_load(src))
    end

    protected

    def store
      @yaml
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
