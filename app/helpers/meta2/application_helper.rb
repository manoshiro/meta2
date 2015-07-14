module Meta2
  module ApplicationHelper
    def options_of_section_from_meta2_settings_for_select(form)
      options = I18n.t('meta2.setting.sections').to_hash.invert
      options_for_select options, selected: form.object.section.to_s
    end
  end
end
