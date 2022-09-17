# frozen_string_literal: true

require_relative 'override_vault'

module Precursor
  # Extension of [Precursor::OverrideVault] that stored data in thread-local variable
  class ThreadLocalOverrideVault < OverrideVault
    protected

    def store
      Thread.current[:precursor_override_vault] ||= @store
    end
  end
end
