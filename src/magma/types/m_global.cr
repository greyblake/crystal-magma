module Magma
  class MObject
    getter :value

    def initialize(@value)
    end

    def call(method, args)
      case method
      when "puts"
        args.each { |arg| puts arg.value }
        MNil.new
      when "to_s"
        MString.new(@value.to_s)
      else
        abort("Not implement method #{self.class}##{method}")
      end
    end
  end
end
