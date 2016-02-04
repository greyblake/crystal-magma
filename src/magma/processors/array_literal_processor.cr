module Magma
  class ArrayLiteralProcessor < NodeProcessor
    def process(node : Crystal::ArrayLiteral) : MObject
      # Other properties for the node
      #  - of
      #  - name
      arr = node.elements.map { |node| gprocess(node) }
      MArray.new(arr)
    end
  end
end

