# frozen_string_literal: true

module Precursor
  class ConfigKeyBuilder
    def initialize
      @key_options = {}
    end

    def default(value)
      @key_options[:default] = value
    end

    def build
      @key_options
    end
  end
end
