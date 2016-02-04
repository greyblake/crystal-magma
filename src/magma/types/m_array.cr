module Magma
  class MArray < MObject
    def initialize(@value : Array(MObject))
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
        str = value.map { |item| item.value }.to_s
        MString.new(str)
      else
        super
      end
    end
  end
end
