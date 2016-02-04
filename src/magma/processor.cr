
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
      def gprocess(node : Crystal::ASTNode|Nil)
        case node
        {% for node, index in nodes %}
        when Crystal::{{node}}
            {{node}}Processor.new(self).process(node as Crystal::{{node}})
        {% end %}
        else
          node_name = node.class.to_s.split("::").last
          puts "Processor#gprocess: can't process node #{node.class}"
          puts <<-MSG
          Implement Magma::#{node_name}Processor class:

          module Magma
            class #{node_name}Processor < NodeProcessor
              def process(node : Crystal::#{node_name}) : MObject
              end
            end
          end

          And register in processor.cr

            define_gprocess [Assign, StringLiteral, ... , #{node_name}]

          MSG
          exit 1
        end
      end
    end

    include MTypeWrapper
    getter :context

    define_gprocess [
      Assign, StringLiteral, NumberLiteral, Call, Expressions, BoolLiteral, Var, Or, And, NilLiteral, CharLiteral,
      StringInterpolation, SymbolLiteral
    ]

    def initialize
      @context = Hash(String, MObject).new
    end

    def set_var(name, value)
      context[name] = value
    end
  end
end
