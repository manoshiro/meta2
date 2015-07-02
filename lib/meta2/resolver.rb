module Meta2
  class Resolver
    attr_reader :strategy, :context, :options

    def setup(strategy, context, options)
      @strategy, @context, @options = strategy, context, options
    end

    def detect
      Meta2.debug "strategy: #{strategy}"
      strategy_class_name = "Meta2::Strategies::#{@strategy.to_s.camelize}"

      strategy = strategy_class_name.constantize.new @options
      strategy.detect
    end
  end
end
