#require "compiler/crystal/**"

# Require minimal to use Parser
require "compiler/crystal/program"
require "compiler/crystal/compiler"
require "compiler/crystal/syntax/**"
require "compiler/crystal/semantic/**"


alias Any = Int32 | Int64 | UInt64 | Float64 | Nil | Bool | String | Char

require "./magma/mtype_wrapper"
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
