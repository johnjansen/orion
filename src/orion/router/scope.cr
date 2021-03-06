abstract class Orion::Router
  # Create a group at the specified path.
  private macro scope(path = "", *, clear_handlers = false, **opts)
    {% counter = GROUP_COUNTER[0] = GROUP_COUNTER[0] + 1 %}
    {% superclass = @type %}
    class RouterGroup{{counter}} < {{superclass}}
      BASE_PATH = File.join({{superclass}}::BASE_PATH, {{path}})
      BASE_MODULE = {{opts[:module]}} || {{superclass}}::BASE_MODULE

      def self.trees
        {{superclass}}.trees
      end

      def self.routes
        {{superclass}}.routes
      end

      HANDLERS.clear if {{clear_handlers}}
      {{yield}}
    end
  end
end
