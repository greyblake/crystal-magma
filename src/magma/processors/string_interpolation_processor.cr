module Magma
  class StringInterpolationProcessor < NodeProcessor
    def process(node : Crystal::StringInterpolation) : MObject
      strs = node.expressions.map do |exp|
        (gprocess(exp).call("to_s").value) as String
      end
      mtype_wrap(strs.join(""))
    end
  end
end
