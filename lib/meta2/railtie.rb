module Meta2
  class Railtie < Rails::Railtie
    config.meta2 = ActiveSupport::OrderedOptions.new

    initializer 'meta2' do |app|
      config = app.config.meta2

      # Default settings. all subject can be changed.
      config.strategy         = :i18n
      config.assign_name      = :meta2
      config.sections         = %w{formats defaults parts}
      config.columns          = %w{title description keywords}
      config.logger           = Rails.logger
      config.logging          = true
      config.controller_base  = 'ApplicationController'
      config.per_for_paginate = 20
      config.session_name     = '___current_meta2_app_name___'
    end
  end
end
