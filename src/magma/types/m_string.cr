module Magma
  class MString < MObject
    def call(method, args = [] of MObject : Array(MObject))
      case method
      when "to_s"
        self
      else
        super
      end
    end
  end
end
