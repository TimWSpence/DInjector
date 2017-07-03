require "injector/version"

module Injector

  class Injector

    def register(name, singleton = true, &block)
      define_singleton_method name do
        if singleton
          instance_variable_set "@#{name}", (instance_variable_get("@#{name}") || block[self])
          instance_variable_get "@#{name}"
        else
          block[self]
        end
      end
    end

    def method_missing(name, *args)
      raise NotRegisteredError, "#{name} not registered"
    end
  end

  class NotRegisteredError < StandardError
  end

end
