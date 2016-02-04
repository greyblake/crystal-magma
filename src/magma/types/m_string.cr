module Magma
  class MString < MObject
    def call(method, args = [] of MObject : Array(MObject))
      case method
      when "to_s"
        self
      else
        abort("Not implement method #{self.class}##{method}")
      end
    end
  end
end
