module Magma
  class MObject
    include MTypeWrapper

    getter :value

    def initialize(@value)
    end

    def call(method, args = [] of MObject : Array(MObject))
      case method
      when "puts"
        args.each { |arg| puts arg.call("to_s").value }
        MNil.new
      when "to_s"
        MString.new(@value.to_s)
      else
        abort("Not implement method #{self.class}##{method}")
      end
    end
  end
end
