module Magma
  class MTuple < MObject
    def initialize(@value : Array(MObject))
    end

    # TODO: hack, could it be done without casting?
    def value
      @value as Array(MObject)
    end

    def call(method, args : Array(MObject))
      case method
      when "to_s"
        call("inspect", args)
      when "inspect"
        list = value.map { |item| item.call("inspect", [] of MObject).value }.join(", ")
        MString.new("{#{list}}")
      when "[]"
        index = args.first.value as Int64
        value[index]
      else
        super
      end
    end
  end
end
