module Magma
  class VarProcessor < NodeProcessor
    def process(node : Crystal::Var) : MObject
      context[node.name]
    end
  end
end
