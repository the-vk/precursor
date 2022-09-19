# frozen_string_literal: true

module Precursor
  # Root class to access config vaults
  class ConfigRoot
    def initialize(vaults, key_options)
      @vaults = vaults
      @key_options = key_options

      @vaults.each do |v|
        v.load(self)
      end
    end

    def [](key)
      key_vault = @vaults.find { |v| v.key? key }

      value = key_vault.value key unless key_vault.nil?
      value = get_default(key) if key_vault.nil?

      value.is_a?(String) ? resolve(value) : value
    end

    # Tests if config value exist for a given key
    # @param key [Symbol] Config key
    # return [Boolean] True if value exists; false otherwise
    def key?(key)
      @vaults.any? { |v| v.key? key }
    end

    def resolve(str)
      res = str
      until (m = res.match(VAR_PATTERN)).nil?
        k = m[1]
        v = self[k.to_sym]
        res = res.sub("${#{k}}", v.to_s)
      end
      res
    end

    private

    VAR_PATTERN = /\$\{(?<var_name>[a-zA-Z]+[\w.]+)\}/
    MAX_DEPTH = 16

    def get_default(key)
      has_default = @key_options.key?(key) && @key_options[key].key?(:default)
      raise KeyError, "key #{key} not found" unless has_default

      @key_options[key][:default]
    end
  end
end
