require "compiler/crystal/**"

alias Any = Int32 | Int64 | UInt64 | Float64 | Nil | Bool | String | Char
alias AnyArray = Array(Any)
alias AnyHash = Hash(Any|AnyArray, Any|AnyArray)

require "./magma/processor"
require "./magma/interpreter"
require "./magma/processors/node_processor"
require "./magma/processors/*"

require "./magma/types/m_object"
require "./magma/types/*"


module Magma
end


code = File.read(ARGV[0])

interpreter = Magma::Interpreter.new
interpreter.execute(code)
