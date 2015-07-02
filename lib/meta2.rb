require 'active_support/dependencies'

module Meta2
  autoload :Absorber,   'meta2/absorber'
  autoload :Strategies, 'meta2/strategies'
  autoload :Resolver,   'meta2/resolver'
  autoload :Version,    'meta2/version'

  module Helpers
    autoload :ActionViewExtension, 'meta2/helpers/action_view_extension'
  end

  module Models
    autoload :MetaSetting,  'meta2/models/meta_setting'
  end

  module Strategies
    autoload :I18n,         'meta2/strategies/i18n'
    autoload :ActiveRecord, 'meta2/strategies/active_record'
  end

  class << self
    def configure
      yield self.config
    end

    def config
      Rails.application.config.meta2
    end

    def debug(message)
      return unless self.config.logging
      self.config.logger.debug "[META2] #{message}"
    end
  end
end

if defined? Rails
  require 'meta2/rails'
  require 'meta2/railtie'
end
