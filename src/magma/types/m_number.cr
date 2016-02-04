module Magma
  class MNumber < MObject
    # TODO: refactor duplications, using macro
    def call(method : String, args : Array(MObject))
      case method
      when "**"
        result = (@value as Number) ** (args.first.value as Number)
        mtype_wrap(result)
      when "-"
        result = (@value as Number) - (args.first.value as Number)
        mtype_wrap(result)
      when "/"
        result = (@value as Number) / (args.first.value as Number)
        mtype_wrap(result)
      when "+"
        result = (@value as Number) + (args.first.value as Number)
        mtype_wrap(result)
      when "inspect"
        MString.new(@value.inspect)
      when "to_s"
        MString.new(@value.to_s)
      else
        super(method, args)
      end
    end
  end
end
