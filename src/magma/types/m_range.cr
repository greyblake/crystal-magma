module Magma
  class MRange < MObject
    def initialize(@from : MObject, @to : MObject, @exclusive : Bool)
    end

    def call(method, args = [] of MObject : Array(MObject))
      case method
      when "to_s"
        call("inspect", args)
      when "inspect"
        from_str = @from.call("inspect", [] of MObject).value
        to_str = @to.call("inspect", [] of MObject).value
        interval = @exclusive ? "..." : ".."
        MString.new("#{from_str}#{interval}#{to_str}")
      else
        super
      end
    end
  end
end
