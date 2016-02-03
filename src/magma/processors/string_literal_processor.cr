module Magma
  class StringLiteralProcessor < NodeProcessor
    def process(node : Crystal::StringLiteral)
      node.value
    end
  end
end
