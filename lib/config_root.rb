# frozen_string_literal: true

module Precursor
  class ConfigRoot
    def initialize(vaults, key_options)
      @vaults = vaults
      @key_options = key_options
    end

    def [](key)
      found = false
      value = nil
      @vaults.each do |v|
        next unless v.key? key

        found = true
        value = v.value key
        break
      end

      if !found && @key_options.key?(key) && @key_options[key].key?(:default)
        found = true
        value = @key_options[key][:default]
      end

      raise KeyError, "key #{key} not found" unless found

      value = resolve_variables(value) if value.is_a? String

      value
    end

    private

    VAR_PATTERN = /\$\{(?<var_name>[a-zA-Z]+[\w.]+)\}/
    MAX_DEPTH = 16

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
