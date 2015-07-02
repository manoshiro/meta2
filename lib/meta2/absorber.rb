module Meta2
  class Absorber
    attr_accessor :formats, :defaults, :parts

    def to_html(context)
      tags = Meta2.config.columns.map do |column_name|
        value = @parts[column_name.to_sym].presence || @defaults[column_name.to_sym]
        next nil if value.blank?

        value = begin
          context.instance_eval do
            eval "\"#{value}\""
          end
        rescue
          Meta2.debug "#{column_name} was happened syntax error"
          value
        end

        if @formats[column_name.to_sym].present?
          value = @formats[column_name.to_sym].gsub '%', value
        end

        case column_name
        when 'title'
          '<title>%s</title>' % [value]
        when 'description'
          meta_tag column_name, value
        when 'keywords'
          meta_tag column_name, value
        end
      end

      tags.compact!
      tags.join("\n")
    end


    private

    def meta_tag(name, value)
      '<meta name="%s" content="%s" />' % [name, value]
    end
  end
end
