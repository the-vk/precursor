# frozen_string_literal: true

require_relative '../lib/precursor'

config = Precursor.create do |builder|
  argv = ['-f', '--db-provider=MONGO', '--limit=3/4']

  builder.key :flag do |kb|
    kb.default false
  end

  builder.vault(Precursor::ArgvVault.new(argv) do |v|
    v.key :'db.provider' do |kv|
      kv.long '--db-provider=DBPROVIDER'
      kv.description 'DB provider name'
    end
    v.key :force do |kv|
      kv.short '-f'
      kv.type TrueClass
      kv.description 'Force action'
    end
    v.key :'fraction.limit' do |kv|
      kv.long '--limit=LIMIT'
      kv.type Numeric
      kv.description 'Fractional limit'
    end
    v.key :flag do |kv|
      kv.short '-a'
      kv.type TrueClass
      kv.description 'A flag'
    end
  end)
end

pp config[:'db.provider']
pp config[:force]
pp config[:'fraction.limit']
pp config[:flag]
