module Meta2
  class Railtie < Rails::Railtie
    config.meta2 = ActiveSupport::OrderedOptions.new

    initializer 'meta2' do |app|
      config = app.config.meta2
      config.strategy    = :i18n
      config.assign_name = :meta2
      config.columns     = %w{title description keywords}
      config.logger      = Rails.logger
      config.logging     = true
    end
  end
end
