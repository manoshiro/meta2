module Meta2
  module Helpers
    module ActionViewExtension
      def meta_tags
        resolver = instance_variable_get "@#{Meta2.config.assign_name}"

        html_source = resolver.detect.to_html(resolver.context)
        unless Rails.env.production?
          asist_message = resolver.options[:prefixes].map do |prefix|
            '%s.%s' % [prefix, resolver.options[:template]]
          end.join "\n"
          html_source += "<!--Meta2 path hinting.\n#{asist_message} -->\n"
        end
        html_source.html_safe
      end
    end
  end
end
