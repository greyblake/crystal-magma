module Magma
  class MRegex < MObject
    def call(method, args = [] of MObject : Array(MObject))
      case method
      when "to_s"
        MString.new(value.to_s)
      when "inspect"
        MString.new(value.inspect)
      else
        super
      end
    end
  end
end
