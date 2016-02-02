class Hash
  #def []=(key : AnyHash|AnyArray, val : AnyHash|AnyArray)
  #end

  def []=(key :  Any|AnyArray, value : AnyHash)
    puts "No support for nested hashes"
    abort "#{__FILE__}:#{__LINE__}"
  end


  #def []=(key : (Nil | String | Char | Bool | Int64 | UInt64 | Array(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64) | Hash(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64 | Array(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64),
  #        value : Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64 | Array(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64))), (Nil | String | Char | Bool | Int64 | UInt64 | Array(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64) | Hash(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64 | Array(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64), Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64 | Array(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64)))

end
