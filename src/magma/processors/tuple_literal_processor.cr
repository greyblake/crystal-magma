module Magma
  class TupleLiteralProcessor < NodeProcessor
    def process(node : Crystal::TupleLiteral) : MObject
      arr = node.elements.map { |el| gprocess(el) }
      MTuple.new(arr)
    end
  end
end
