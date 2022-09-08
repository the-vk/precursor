# frozen_string_literal: true

require_relative 'override_vault'

module Precursor
  class ThreadLocalOverrideVault < OverrideVault
    protected

    def store
      Thread.current[:precursor_override_vault] ||= {}
    end
  end
end
