module Magma
  # This one has to be refactored to delegate calls to the types.
  class CallProcessor < NodeProcessor
    def process(node : Crystal::Call) : MObject
      if node.obj
        abort "#{__FILE__}:#{__LINE__} - Currently process only global calls"
        #obj = gprocess(node.obj)
        #case obj
        #when Number
        #  process_number(obj)
        #when Bool
        #  process_bool(obj as Bool)
        #when Array
        #  process_array(obj)
        #else
        #  puts "Can't handle #{obj.class}"
        #  abort "#{__FILE__}:#{__LINE__}"
        #end
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
      args = node.args.map {|node| gprocess(node) }

      MObject.new(nil).call(node.name, args)

      # call global method
      #case node.name
      #when "puts"
      #  node.args.each do |arg|
      #    puts gprocess(arg)
      #  end
      #  nil
      #else
      #  abort "process_call:: (no obj) unknown call name: #{node.name.inspect}"
      #end
    end
  end
end
