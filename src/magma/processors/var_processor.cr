module Magma
  class VarProcessor < NodeProcessor
    def process(node : Crystal::Var) : MObject
      var_context[node.name]
    end
  end
end
