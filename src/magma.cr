require "compiler/crystal/**"

alias Any = Int32 | Int64 | UInt64 | Float64 | Nil | Bool | String | Char
alias AnyArray = Array(Any)

require "./magma/**"


module Magma
end


code = File.read(ARGV[0])
node = Crystal::Parser.parse(code)

processor = Magma::Processor.new(false)
processor.process_node(node)
