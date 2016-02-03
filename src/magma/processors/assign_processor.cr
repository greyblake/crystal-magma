module Magma
  class AssignProcessor < NodeProcessor
    def process(node : Crystal::Assign)
      case node.target
      when Crystal::Var
        var = node.target as Crystal::Var
        value = gprocess(node.value)
        set_var(var.name, value)
      else
        abort "AssignProcessor: unknown node: #{node.class}"
      end
    end
  end
end
