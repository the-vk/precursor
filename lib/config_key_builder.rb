# frozen_string_literal: true

module Precursor
  # A builder to provide Precursor key options
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
