module Magma
  class BoolLiteralProcessor < NodeProcessor
    def process(node : Crystal::BoolLiteral) : MBool
      value = node.true_literal? ? true : false
      MBool.new(value)
    end
  end
end
