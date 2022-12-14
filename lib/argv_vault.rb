# frozen_string_literal: true

require 'optparse'
require 'optparse/date'
require 'optparse/time'
require 'optparse/uri'

require_relative 'vault'

module Precursor
  # Vault that parses command line arguments
  class ArgvVault < Vault
    def initialize(argv)
      super()

      @argv = argv
      @vault_data = {}
      @parser = OptionParser.new do |parser|
        parser.on('-h', '--help', 'Prints this help') do
          puts parser
          exit
        end
      end
      yield self
    end

    def key(key_name)
      builder = ArgvKeyBuilder.new(key_name)
      yield builder
      builder.build(@parser, @vault_data)
    end

    protected

    def load_store(_config_root)
      @parser.parse(@argv)
      @vault_data
    end

    # A builder to configure ArgvVault key options
    class ArgvKeyBuilder
      def initialize(key_name)
        @key_name = key_name
        @short = []
        @long = []
        @type = nil
        @description = nil
      end

      def short(short_key)
        @short.push(short_key)
      end

      def long(long_key)
        @long.push(long_key)
      end

      def type(type)
        @type = type
      end

      def description(desc)
        @description = desc
      end

      def build(parser, vault_data)
        args = @short + @long
        args.push(@type) unless @type.nil?
        args.push(@description) unless @description.nil?

        parser.on(*args) do |v|
          vault_data[@key_name] = v
        end
      end
    end
  end
end
