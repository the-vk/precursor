# frozen_string_literal: true

require 'yaml'

require_relative 'vault'

module Precursor
  class YamlVault < Vault
    def initialize(src)
      @yaml = flat_hash(YAML.load(src))
    end

    def key?(key)
      @yaml.key? key
    end

    def value(key)
      @yaml[key]
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
      flat_hash.reduce(:merge).transform_keys { |k| k.to_sym }
    end
  end
end
