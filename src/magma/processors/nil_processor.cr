module Magma
  class NilLiteralProcessor < NodeProcessor
    def process(node : Crystal::NilLiteral) : MObject
      MNil.new
    end
  end
end
