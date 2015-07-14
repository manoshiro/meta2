module Meta2
  class Setting < ActiveRecord::Base
    with_options on: :pre_check do
      validates :section, presence: true, inclusion: { in: Meta2.config.sections }
    end

    with_options on: :formats do
      validates :app_name,  presence: true, uniqueness: {scope: [:section, :path, :name]}
      validates :name,      presence: true
      validates :value,     presence: true, format: {with: /\A.*\%.*\Z/i, message: I18n.t('meta2.setting.message.incorrect_format_for_formats_value')}
    end

    with_options on: :defaults do
      validates :app_name,  presence: true, uniqueness: {scope: [:section, :path, :name]}
      validates :name,      presence: true
      validates :value,     presence: true
    end

    with_options on: :parts do
      validates :app_name,  presence: true, uniqueness: {scope: [:section, :path, :name]}
      validates :path,      presence: true
      validates :name,      presence: true
      validates :value,     presence: true
    end


    scope :by_app_name, ->(app_name) {
      where app_name: app_name
    }

    scope :formats, -> {
      where section: 'formats'
    }

    scope :defaults, -> {
      where section: 'defaults'
    }

    scope :parts, -> {
      where section: 'parts'
    }

    def method_missing(method, *args)
      check_name = method.to_s.gsub '?', ''
      unless %w(formats defaults parts).include? check_name
        super(method, args) and return
      end

      self.section == check_name
    end

    class << self
      def app_names
        self.group(:app_name).pluck :app_name
      end

      def sections
        Meta2.config.sections
      end
    end
  end
end
