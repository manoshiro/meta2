module Meta2
  module Strategies
    class ActiveRecord
      include Meta2::Strategies

      def detect
        absorber = Meta2::Absorber.new
        absorber.formats  = get_section :formats
        absorber.defaults = get_section :defaults

        retrieve_parts do |path|
          settings = parts.where path: path
          section = settings.find_each.map do |setting|
            [setting.name.to_sym, setting.value]
          end
          next nil if section.blank?
          absorber.parts = Hash[*section.flatten]
        end
        absorber.parts ||= Hash.new

        absorber
      end

      def build_path(prefix)
        path_prefix = prefix.gsub '/', '.'
        '%s.%s' % [path_prefix, @options[:template]]
      end


      private

      def parts
        targets.where section: :parts
      end

      def get_section(namespace)
        section = targets.where(section: namespace).find_each.map do |setting|
          [setting.name.to_sym, setting.value]
        end
        section = Hash[*section.flatten]

        default_formats.merge section
      end

      def targets
        Meta2::Models::MetaSetting.where app_name: @config[:assign_name]
      end
    end
  end
end
