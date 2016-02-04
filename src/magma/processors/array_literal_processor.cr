module Magma
  class ArrayLiteralProcessor < NodeProcessor
    def process(node : Crystal::ArrayLiteral) : MObject
      # Other properties for the node
      #  - of
      #  - name
      arr = node.elements.map { |node| gprocess(node) }

      pp node
      pp node.of
      pp node.name

      MArray.new(arr)
    end
  end
end

