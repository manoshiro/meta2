module ActionView
  class Renderer
    def render_template_with_meta2(context, options)
      config = Meta2.config

      resolver = context.assigns[config.assign_name]
      resolver.setup config.strategy, context, options

      render_template_without_meta2 context, options
    end

    alias_method_chain :render_template, :meta2
  end
end

module AbstractController
  module Rendering
    def view_assigns_with_meta2
      hash = view_assigns_without_meta2
      hash[Meta2.config.assign_name] = Meta2::Resolver.new
      hash
    end

    alias_method_chain :view_assigns, :meta2
  end
end
