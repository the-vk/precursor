# frozen_string_literal: true

require_relative 'yaml_vault'

module Precursor
  # A vault that reads yaml data from a file
  class YamlFileVault < YamlVault
    def initialize(file_path)
      super('')
      @file_path = file_path
    end

    protected

    def load_store(config_root)
      file_path = config_root.resolve(@file_path)
      @yaml = File.new(file_path).read if File.exist?(file_path)

      super(config_root)
    end
  end
end
