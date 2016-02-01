module Magma
  class CallProcessor
    getter :processor, :node

    def initialize(@processor, @node : Crystal::Call)
    end

    def process
      if node.obj
        obj = processor.process_node(node.obj)
        case obj
        when Number
          process_number(obj)
        else
          raise("Can't handle #{obj.class}")
        end
      else
        process_global
      end
    end

    private def process_bool(obj)
      case node.name
      when "!"
        !obj
      else
        raise("Unknown method for #{obj.inspect}: #{node.name}")
      end
    end

    private def process_number(obj)
      val = processor.process_node(node.args.first)

      case node.name
      when "+"
        obj + val
      when "-"
        obj - val
      when "*"
        obj * val
      when "/"
        obj / val
      when "**"
        obj **(val)
      when "<=>"
        obj <=> val
      when "=="
        obj == val
      when ">"
        obj > val
      when "<"
        obj < val
      when "abs"
        obj.abs
      when "abs2"
        obj.abs2
      else
        raise("Unknown method for #{obj.inspect}: `#{node.name}`")
      end
    end

    private def process_global
      # call global method
      case node.name
      when "puts"
        node.args.each do |arg|
          puts processor.process_node(arg)
        end
        nil
      else
        abort "process_call:: (no obj) unknown call name: #{node.name.inspect}"
      end
    end

  end
end
