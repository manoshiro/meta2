module Meta2
  module Helpers
    module ActionViewExtension
      def meta_tags
        resolver = instance_variable_get "@#{Meta2.config.assign_name}"

        resolver.detect.to_html(resolver.context).html_safe
      end
    end
  end
end
