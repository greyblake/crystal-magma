module Magma
  class RangeLiteralProcessor < NodeProcessor
    def process(node : Crystal::RangeLiteral) : MObject
      from = gprocess(node.from)
      to = gprocess(node.to)

      exclusive = node.exclusive
      MRange.new(from, to, exclusive)
    end
  end
end
