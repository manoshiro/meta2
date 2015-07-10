module Meta2
  class Setting < ActiveRecord::Base
    scope :app_base, ->(app_name) {
      where app_name: app_name
    }

    scope :formats, -> {
      where app_name: 'formats'
    }

    scope :defaults, -> {
      where app_name: 'defaults'
    }

    scope :parts, -> {
      where app_name: 'parts'
    }

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
