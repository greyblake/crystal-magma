module Magma
  class Processor
    getter :context

    def initialize(debug = false)
      @context = Hash(String, Any|Array(Any)).new
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
      when Crystal::Or
        process_or(node as Crystal::Or)
      when Crystal::And
        process_and(node as Crystal::And)
      when Crystal::CharLiteral
        process_char_literal(node as Crystal::CharLiteral)
      when Crystal::StringInterpolation
        process_string_interpolation(node as Crystal::StringInterpolation)
      when Crystal::SymbolLiteral
        process_symbol_literal(node as Crystal::SymbolLiteral)
      when Crystal::ArrayLiteral
        process_array_literal(node as Crystal::ArrayLiteral)
      when Crystal::HashLiteral
        process_hash_literal(node as Crystal::HashLiteral)
      when Crystal::NilLiteral
        nil
      else
        abort "process_node:: unknown node: #{node.class}"
      end
    end

    def process_hash_literal(node : Crystal::HashLiteral)
      puts "process_hash_literal" if @debug
      # node properties:
      #  * entries
      #  * of
      #  * name

      puts "no support for Hashes"
      abort "#{__FILE__}:#{__LINE__}"
      #hash = AnyHash.new

      #node.entries.each do |entry|
      #  key = process_node(entry.key)
      #  value = process_node(entry.value)
      #  hash[key] = value
      #end
      #hash
    end

    def process_array_literal(node : Crystal::ArrayLiteral)
      puts "process_array_literal" if @debug

      array = [] of Any

      # Other properties for the node
      #  - of
      #  - name
      node.elements.each do |element|
        array << process_node(element)
      end

      array
    end

    def process_symbol_literal(node : Crystal::SymbolLiteral)
      puts "process_string_interpolation" if @debug

      # TODO: It's not possible to convert Strings to Symbols dynamically,
      # we have to find a way to manage this properly...
      node.value
    end

    def process_string_interpolation(node : Crystal::StringInterpolation) : String
      puts "process_string_interpolation" if @debug

      arr = [] of String
      node.expressions.each do |exp|
        arr << process_node(exp).to_s
      end
      arr.join("")
    end

    def process_char_literal(node : Crystal::CharLiteral)
      puts "process_char_literal" if @debug
      node.value
    end

    def process_or(node : Crystal::Or)
      puts "process_or" if @debug
      left = process_node(node.left)
      right = process_node(node.right)
      left || right
    end

    def process_and(node : Crystal::And)
      puts "process_and" if @debug
      left = process_node(node.left)
      right = process_node(node.right)
      left && right
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
      NumberLiteralProcessor.new(self, node).process
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
