module Magma
  class MNumber < MObject
    # TODO: refactor duplications, using macro
    def call(method, args = [] of MObject : Array(MObject))
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
        result = (@value as Number) / (args.first.value as Number)
        mtype_wrap(result)
      else
        super(method, args)
      end
    end
  end
end
