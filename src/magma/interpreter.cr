module Magma
  class Interpreter < Processor
    def initialize
      @context = Hash(String, Any).new
    end

    def execute(code : String)
      node = Crystal::Parser.parse(code)
      gprocess(node)
    end
  end
end
