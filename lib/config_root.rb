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
        if v.key? key
          found = true
          value = v.value key
          break
        end
      end

      if !found && @key_options.key?(key) && @key_options[key].key?(:default)
        found = true
        value = @key_options[key][:default]
      end

      raise KeyError, "key #{key} not found" unless found
      value
    end
  end
end
