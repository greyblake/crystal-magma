module Magma
  class MSymbol < MObject
    def call(method, args : Array(MObject))
      case method
      when "to_s"
        MString.new(value)
      when "inspect"
        MString.new(":#{value}")
      else
        super
      end
    end
  end
end
