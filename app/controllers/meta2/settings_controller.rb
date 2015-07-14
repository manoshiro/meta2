module Meta2
  class SettingsController < Meta2.config.controller_base.constantize
    helper Meta2::ApplicationHelper
    helper_method :app_name_from_session

    before_action :set_setting, only: [:edit, :update, :destroy]

    def index
      if settings_base.blank?
        redirect_to new_setting_path and return
      end

      @settings = settings_base.all
      @settings = @settings.page(params[:page]).per(Meta2.config.per_for_paginate)
    end

    def new
      @setting = settings_base.new app_name: app_name_from_session
    end

    def create
      @setting = settings_base.new setting_params
      if @setting.valid?(:pre_check) && @setting.save(context: @setting.section.to_sym)
        session[Meta2.config.session_name] = @setting.app_name
        redirect_to edit_setting_path(@setting), notice: I18n.t('meta2.setting.message.created')
      else
        render :new
      end
    end

    def edit
    end

    def update
      @setting.attributes = setting_params
      if @setting.valid?(:pre_check) && @setting.save(context: @setting.section.to_sym)
        redirect_to edit_setting_path(@setting), notice: I18n.t('meta2.setting.message.updated')
      else
        render :edit
      end
    end

    def destroy
      if %w(formats defaults).include? @setting.section
        redirect_to settings_path, alert: I18n.t('meta2.setting.message.not_destroy') and return
      end

      @setting.destroy
      redirect_to settings_path, notice: I18n.t('meta2.setting.message.destroyed')
    end

    def change_app
      setting = Setting.find_by app_name: params[:app_name]
      if setting.blank?
        not_found and return
      end

      session[Meta2.config.session_name] = params[:app_name]

      redirect_to settings_path
    end


    private

    def set_setting
      @setting = settings_base.find_by id: params[:id]
      not_found if @setting.blank?
    end

    def setting_params
      params.required(:setting).permit(:app_name, :section, :path, :name, :value, :note)
    end

    def settings_base
      Setting.by_app_name app_name_from_session
    end

    def app_name_from_session
      session[Meta2.config.session_name].presence || 'meta2'
    end
  end
end
