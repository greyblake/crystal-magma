module Magma
  # Basic class for the all node processors
  abstract class NodeProcessor < Processor
    getter :parent

    def initialize(@parent)
      super()
    end

    def context
      parent.context
    end

    # Does not work really work
    #abstract def process(node : Crystal::ASTNode)
  end
end
