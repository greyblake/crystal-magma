class Array
  def <<(arg : AnyArray)
    puts "Array << Array is not supported"
    abort "#{__FILE__}:#{__LINE__}"
  end


  alias ComplecatedType =  (Hash(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64 | Array(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64), Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64 | Array(Nil | String | Float64 | Char | Bool | Int32 | Int64 | UInt64)))

  def <<(arg : ComplecatedType)
    puts "Array << Array is not supported"
    abort "#{__FILE__}:#{__LINE__}"
  end

  def to_f64
    puts "Undefined method Array.to_f64"
    abort "#{__FILE__}:#{__LINE__}"
  end
end
