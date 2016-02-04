module Magma
  # class Def < ASTNode
  #   property :receiver
  #   property :name
  #   property :args
  #   property :body
  #   property :block_arg
  #   property? :macro_def
  #   property :return_type
  #   property :yields
  #   property :instance_vars
  #   property :calls_super
  #   property :calls_initialize
  #   property :uses_block_arg
  #   property :assigns_special_var
  #   property :name_column_number
  #   property :abstract
  #   property :attributes
  #   property :splat_index
  #   property :doc

  class DefProcessor < NodeProcessor
    def process(node : Crystal::Def) : MObject
      #method = MDef.new(
      #  node.receiver,
      #  node.name,
      #  node.args,
      #  node.body
      #)
      unless node.name
        raise("DefProcessor: no method name")
      end
      name = node.name as String

      method_context[name] = node
      MSymbol.new(node.name)
    end
  end
end
