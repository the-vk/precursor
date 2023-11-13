# frozen_string_literal: true

require 'rake'

require_relative './lib/version'

Gem::Specification.new do |spec|
  spec.name                   = 'precursor'
  spec.summary                = 'Extensible config system'
  spec.version                = Precursor::VERSION
  spec.homepage               = 'https://github.com/the-vk/precursor'
  spec.authors                = ['Andrey Maraev']
  spec.email                  = ['the_vk@thevk.net']
  spec.license                = 'MIT'
  spec.required_ruby_version  = '~> 3.0'
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.files = FileList['lib/**/*.rb'].to_a

  spec.add_dependency 'optparse', '>= 0.2', '< 0.5'

  spec.add_development_dependency 'code-scanning-rubocop'
  spec.add_development_dependency 'debug'
  spec.add_development_dependency 'rubocop'
end
