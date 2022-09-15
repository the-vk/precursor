# frozen_string_literal: true

require_relative 'config_root_builder'

require_relative 'argv_vault'
require_relative 'env_vault'
require_relative 'hash_vault'
require_relative 'override_vault'
require_relative 'thread_local_override_vault'
require_relative 'yaml_vault'

# Entry point to Precursor
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
