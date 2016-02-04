module Magma
  class SymbolLiteralProcessor < NodeProcessor
    def process(node : Crystal::SymbolLiteral) : MObject
      MSymbol.new(node.value)
    end
  end
end
