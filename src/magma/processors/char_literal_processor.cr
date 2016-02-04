module Magma
  class CharLiteralProcessor < NodeProcessor
    def process(node : Crystal::CharLiteral) : MObject
      MChar.new(node.value)
    end
  end
end
