module Magma
  # Basic class for the all node processors
  abstract class NodeProcessor < Processor
    getter :parent

    def initialize(@parent)
      super()
    end

    def var_context
      parent.var_context
    end

    def method_context
      parent.method_context
    end

    # Does not work really work
    #abstract def process(node : Crystal::ASTNode)
  end
end
