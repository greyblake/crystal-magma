module Magma
  class AssignProcessor < NodeProcessor
    def process(node : Crystal::Assign) : MObject
      case node.target
      when Crystal::Var
        var = node.target as Crystal::Var
        value = gprocess(node.value)
        var_context[var.name] = value
      else
        abort "AssignProcessor: unknown node: #{node.class}"
      end
    end
  end
end
