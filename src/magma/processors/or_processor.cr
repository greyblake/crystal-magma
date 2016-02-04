module Magma
  class OrProcessor < NodeProcessor
    def process(node : Crystal::Or) : MObject
      left = gprocess(node.left)
      right = gprocess(node.right)
      mtype_wrap(left.value || right.value)
    end
  end
end

