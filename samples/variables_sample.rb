# frozen_string_literal: true

require_relative '../lib/precursor'

config = Precursor.create do |builder|
  config_hash = {
    env: 'stage',
    'db.protocol': 'db',
    'db.name': 'app-db',
    'db.host.stage': '1.2.3.4',
    'db.host': '${db.host.${env}}',
    con_str: '${db.protocol}://${db.host}/${db.name}'
  }

  builder.vault(Precursor::HashVault.new(config_hash))
end

pp config[:con_str]
