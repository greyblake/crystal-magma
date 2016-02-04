module Magma
  class IfProcessor < NodeProcessor
    # property :cond
    # property :then
    # property :else
    # property :binary
    def process(node : Crystal::If) : MObject
      cond = gprocess(node.cond)
      if cond.value
        gprocess(node.then)
      else
        gprocess(node.else)
      end
    end
  end
end
