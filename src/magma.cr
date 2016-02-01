require "compiler/crystal/**"

require "./magma/**"

module Magma
  alias Any = Int32 | Float64 | Nil | Bool | String
end


code = File.read(ARGV[0])
node = Crystal::Parser.parse(code)

processor = Magma::Processor.new(false)
processor.process_node(node)
