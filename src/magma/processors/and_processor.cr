module Magma
  class AndProcessor < NodeProcessor
    def process(node : Crystal::And) : MObject
      left = gprocess(node.left)
      right = gprocess(node.right)
      mtype_wrap(left.value && right.value)
    end
  end
end
