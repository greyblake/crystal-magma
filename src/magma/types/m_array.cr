module Magma
  class MArray < MObject
    def initialize(@value : Array(MObject))
      @type = MNumber
    end

    # TODO: hack, could it be done without casting?
    def value
      @value as Array(MObject)
    end

    def call(method, args = [] of MObject : Array(MObject))
      case method
      when "first"
        value[0]
      when "to_s"
        list = value.map { |item| item.call("inspect", [] of MObject).value }.join(", ")
        MString.new("[#{list}]")
      when "<<"
        # TODO: raise exception if number of arguments does not match

        new_item = args.first
        value << new_item
        self
      else
        super
      end
    end
  end
end
