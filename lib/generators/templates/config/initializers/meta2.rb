Meta2.configure do |config|
  config.strategy    = :i18n
  config.assign_name = :meta2
  config.columns     = %w{title description keywords}
  config.logger      = Rails.logger
  config.logging     = true
end
