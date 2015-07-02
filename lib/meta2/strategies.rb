module Meta2
  module Strategies
    attr_reader :options, :config, :formats

    def initialize(options)
      @options  = options
      @config   = Meta2.config
    end

    def detect
      raise "`detect` method Must be need to overriden"
    end


    protected

    def retrieve_parts
      @options[:prefixes].detect do |prefix|
        path    = build_path prefix
        result  = yield path
        Meta2.debug "part path:#{path} #{result ? 'hit' : 'miss'}"
        result
      end
    end

    def build_path(prefix)
      path_prefix = prefix.gsub '/', '.'
      '%s.parts.%s.%s' % [
        @config.assign_name, path_prefix, @options[:template]
      ]
    end

    def default_formats
      hash = @config.columns.map do |column|
        [column, '%']
      end
      Hash[*hash.flatten]
    end
  end
end
