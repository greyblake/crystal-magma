module Magma
  class Processor
    getter :context

    def initialize
      @context = Hash(String, Any).new
    end

    def set_var(name, value)
      context[name] = value
    end

    # Generic process, process any possible node
    def gprocess(node : Crystal::ASTNode)
      case node
      when Crystal::Assign
        AssignProcessor.new(self).process(node as Crystal::Assign)
      when Crystal::StringLiteral
        StringLiteralProcessor.new(self).process(node as Crystal::StringLiteral)
      when Crystal::NumberLiteral
        NumberLiteralProcessor.new(self).process(node as Crystal::NumberLiteral)
      else
        abort "Processor#gprocess: can't process node #{node.class}"
      end
    end
  end
end
