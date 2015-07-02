ActiveSupport.on_load(:action_controller) do
  require 'meta2/alias_method_chains'
end

ActiveSupport.on_load(:action_view) do
  ::ActionView::Base.send :include, Meta2::Helpers::ActionViewExtension
end
