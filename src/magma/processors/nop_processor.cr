module Magma
  class NopProcessor < NodeProcessor
    def process(node : Crystal::Nop) : MObject
      MNil.new
    end
  end
end
