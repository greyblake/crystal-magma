module Magma
  # This one has to be refactored to delegate calls to the types.
  class CallProcessor < NodeProcessor
    def process(node : Crystal::Call) : MObject
      if node.obj
        receiver = gprocess(node.obj)
        args = node.args.map { |arg_node| gprocess(arg_node) }
        receiver.call(node.name, args)
      else
        process_global(node)
      end
    end

    #class BlockExecuter < ::Magma::Processor
    #  def initialize(@processor, @block : Crystal::Block, @args : Array)
    #    @context = @processor.context
    #  end

    #  def execute
    #    # Set context variables
    #    @block.args.each_with_index do |var_node, index|
    #      name = var_node.name
    #      @context[name] = @args[index]
    #    end

    #    process_node(@block.body)
    #  end
    #end

    #private def process_array(obj)
    #  case node.name
    #  when "each"
    #    if node.block
    #      obj.each do |item|
    #        BlockExecuter.new(processor, node.block as Crystal::Block, [item]).execute
    #      end
    #    end
    #  when "<<"
    #    obj << processor.process_node(node.args.first)
    #  else
    #    puts "#{__FILE__}:#{__LINE__}"
    #    raise("Unknown method for #{obj.class}: #{node.name}")
    #  end
    #end

    #private def process_bool(obj : Bool)
    #  case node.name
    #  when "!"
    #    !obj
    #  when "^"
    #    arg = processor.process_node(node.args.first)
    #    obj ^ arg
    #  else
    #    raise("Unknown method for #{obj.inspect}: #{node.name}")
    #  end
    #end

    #private def process_number(obj)
    #  val = processor.process_node(node.args.first)

    #  case node.name
    #  when "+"
    #    obj + val
    #  when "-"
    #    obj - val
    #  when "*"
    #    obj * val
    #  when "/"
    #    obj / val
    #  when "**"
    #    obj **(val)
    #  when "<=>"
    #    obj <=> val
    #  when "=="
    #    obj == val
    #  when ">"
    #    obj > val
    #  when "<"
    #    obj < val
    #  when "abs"
    #    obj.abs
    #  when "abs2"
    #    obj.abs2
    #  else
    #    raise("Unknown method for #{obj.inspect}: `#{node.name}`")
    #  end
    #end

    private def process_global(node)
      if method_context[node.name]?
        def_node = method_context[node.name]
        # get actual value of arguments
        args = node.args.map { |arg_node| gprocess(arg_node) }
        MethodCaller.new(self).call(def_node, args)
      else
        args = node.args.map {|node| gprocess(node) }
        MObject.new(nil).call(node.name, args)
      end
    end

    # TODO: hacky, it needs to manage context, but should not inherit form NodeProcessor.
    class MethodCaller < NodeProcessor
      def initialize(*args)
        super(*args)

        # Method should have its own var context.
        @var_context = Hash(String, MObject).new
      end

      # It's necessary, because NodeProcessor redefines +var_context+
      def var_context
        @var_context
      end

      def call(def_node : Crystal::Def, args : Array(MObject))
        # Pass arguments into the method context
        def_node.args.each_with_index do |var_node, index|
          name = var_node.name
          var_context[name] = args[index]
        end
        gprocess(def_node.body)
      end
    end
  end
end
