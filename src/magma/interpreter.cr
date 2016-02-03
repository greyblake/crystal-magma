module Magma
  class Interpreter < Processor
    def initialize
      @context = Hash(String, MObject).new
    end

    def execute(code : String)
      node = Crystal::Parser.parse(code)
      gprocess(node)
    end
  end
end
