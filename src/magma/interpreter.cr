module Magma
  class Interpreter < Processor
    def execute(code : String)
      node = Crystal::Parser.parse(code)
      gprocess(node)
    end
  end
end
