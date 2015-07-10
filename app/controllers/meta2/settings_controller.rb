module Meta2
  class SettingsController < Meta2.config.controller_base.constantize
    def index
    end
  end


  private

  def settings_base
    app_name = session[Meta2.config.session_name].presence || 'meta2'
    Setting.app_base app_name
  end
end
