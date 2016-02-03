
module Magma
  class Processor
    # Generic #gprocess method to process any possible node
    # Example:
    #   def gprocess(node : Crystal::ASTNode)
    #    case node
    #      dispatch_ast_nodes [Assign, StringLiteral, Expressions]
    #    when Crystal::Assign
    #      AssignProcessor.new(self).process(node as Crystal::Assign)
    #    else
    #      abort "Processor#gprocess: can't process node #{node.class}"
    #    end
    #   end
    macro define_gprocess(nodes)
      def gprocess(node : Crystal::ASTNode)
        case node
        {% for node, index in nodes %}
        when Crystal::{{node}}
            {{node}}Processor.new(self).process(node as Crystal::{{node}})
        {% end %}
        else
          abort "Processor#gprocess: can't process node #{node.class}"
        end
      end
    end

    getter :context

    define_gprocess [Assign, StringLiteral, NumberLiteral, Call, Expressions]

    def initialize
      @context = Hash(String, MObject).new
    end

    def set_var(name, value)
      context[name] = value
    end
  end
end
