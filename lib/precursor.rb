# frozen_string_literal: true

require_relative 'config_root_builder'

require_relative 'env_vault'

module Precursor
  class << self
    # Creates a new instance of [Precursor::ConfigRoot]
    def create
      builder = ConfigRootBuilder.new
      yield builder
      builder.build
    end
  end
end
