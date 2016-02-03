module Magma
  class StringLiteralProcessor < NodeProcessor
    def process(node : Crystal::StringLiteral) : MObject
      MString.new(node.value)
    end
  end
end
