module Meta2
  module Strategies
    class I18n
      include Meta2::Strategies

      FAILURE_KEYWORD = '___failure_keyword___'

      def detect
        absorber = Meta2::Absorber.new
        absorber.formats = formats

        absorber.defaults = catch_path :defaults
        if absorber.defaults.blank?
          absorber.defaults = Hash.new
          absorber.parts    = Hash.new
          return absorber
        end

        retrieve_parts do |path|
          parts = ::I18n.t path, default: FAILURE_KEYWORD
          FAILURE_KEYWORD == parts.to_s ? nil : (absorber.parts = parts)
        end
        absorber.parts ||= Hash.new

        absorber
      end

      private

      def catch_path(namespace)
        path = "#{@config.assign_name}.config.#{namespace}"
        Meta2.debug "#{namespace} path:#{path}"
        content = ::I18n.t path, default: FAILURE_KEYWORD
        FAILURE_KEYWORD == content.to_s ? nil : content
      end

      def formats
        if @formats.present?
          @formats
        else
          _formats = catch_path(:formats).presence || Hash.new
          Hash[*default_formats.flatten].merge _formats
        end
      end
    end
  end
end
