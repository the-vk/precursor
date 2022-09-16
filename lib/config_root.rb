# frozen_string_literal: true

module Precursor
  # Root class to access config vaults
  class ConfigRoot
    def initialize(vaults, key_options)
      @vaults = vaults.sort_by(&:priority).reverse
      @key_options = key_options
    end

    def [](key)
      key_vault = @vaults.find { |v| v.key? key }

      value = key_vault.value key unless key_vault.nil?
      value = get_default(key) if key_vault.nil?

      value.is_a?(String) ? resolve_variables(value) : value
    end

    def add_vault(vault)
      @vaults = @vaults.push(vault).sort_by(&:priority).reverse
    end

    private

    VAR_PATTERN = /\$\{(?<var_name>[a-zA-Z]+[\w.]+)\}/
    MAX_DEPTH = 16

    def get_default(key)
      has_default = @key_options.key?(key) && @key_options[key].key?(:default)
      raise KeyError, "key #{key} not found" unless has_default

      @key_options[key][:default]
    end

    def resolve_variables(str)
      res = str
      until (m = res.match(VAR_PATTERN)).nil?
        k = m[1]
        v = self[k.to_sym]
        res = res.sub("${#{k}}", v.to_s)
      end
      res
    end
  end
end
