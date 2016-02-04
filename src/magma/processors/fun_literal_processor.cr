module Magma
  class FunLiteralProcessor < NodeProcessor
    def process(node : Crystal::FunLiteral) : MObject
      MNil.new
    end
  end
end
