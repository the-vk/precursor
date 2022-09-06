# frozen_string_literal: true

module Precursor
  class ConfigRoot
    def initialize(vaults)
      @vaults = vaults
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

      raise KeyError, "key #{key} not found" unless found
      value
    end
  end
end
