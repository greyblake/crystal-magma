module Magma
  class Processor
    def initialize(debug = false)
      @context = Hash(String, Any).new
      @debug = debug
    end

    def process_node(node)
      case node
      when Crystal::Assign
        process_assign(node as Crystal::Assign)
      when Crystal::NumberLiteral
        process_number_literal(node as Crystal::NumberLiteral)
      when Crystal::Call
        process_call(node as Crystal::Call)
      when Crystal::BoolLiteral
        process_bool_literal(node as Crystal::BoolLiteral)
      when Crystal::Expressions
        process_expressions(node as Crystal::Expressions)
      when Crystal::Var
        process_var(node as Crystal::Var)
      when Crystal::StringLiteral
        process_string_literal(node as Crystal::StringLiteral)
      else
        abort "process_node:: unknown node: #{node.class}"
      end
    end

    def process_var(node : Crystal::Var)
      puts "process_var" if @debug
      @context[node.name]
    end

    def process_string_literal(node : Crystal::StringLiteral)
      puts "process_number_literal" if @debug
      node.value
    end

    def process_number_literal(node : Crystal::NumberLiteral)
      puts "process_number_literal" if @debug

      case node.kind
      when :i32
        node.value.to_i
      else
        abort "process_number_literal:: unknown kind: #{node.kind.inspect}"
      end
    end

    def process_assign(node : Crystal::Assign)
      puts "process_assign" if @debug

      case node.target
      when Crystal::Var
        var = node.target as Crystal::Var
        @context[var.name] = process_node(node.value)
      else
        abort "process_assign:: unknown node: #{node.class}"
      end
    end

    def process_call(node : Crystal::Call)
      puts "process_call" if @debug
      CallProcessor.new(self, node).process

    end

    def process_bool_literal(node : Crystal::BoolLiteral)
      puts "process_bool_literal" if @debug
      node.true_literal? ? true : false
    end

    # TODO: figure out what is keyword?
    # pp node.keyword
    def process_expressions(node : Crystal::Expressions)
      puts "process_expressions" if @debug
      result = nil
      node.expressions.each do |node|
        result = process_node(node)
      end
      result
    end
  end
end
