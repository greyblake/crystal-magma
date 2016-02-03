module Magma
  class ExpressionsProcessor < NodeProcessor
    def process(node : Crystal::Expressions) : MObject
      result = MNil.new
      node.expressions.each do |node|
        result = gprocess(node)
      end
      result
    end
  end
end
