module Magma
  module MTypeWrapper
    def mtype_wrap(arg) : MObject
      case arg
      when MObject
        arg
      when Bool
        MBool.new(arg)
      when Number
        MNumber.new(arg)
      else
        raise "#mtype_wrap: unknown type: #{arg.class}"
      end
    end
  end
end
