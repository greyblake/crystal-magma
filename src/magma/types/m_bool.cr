module Magma
  class MBool < MObject
    def call(method, args = [] of MObject : Array(MObject))
      case method
      when "!"
        MBool.new(!@value)
      when "^"
        if args.size != 1
          raise("Wrong number of arguments for 'Bool#^' (#{args.size} for 1)")
        end
        arg = mtype_wrap(args.first)
        result = (@value as Bool) ^ (arg.value as Bool)
        mtype_wrap(result)
      else
        super(method, args)
      end
    end
  end
end
