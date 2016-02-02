struct Bool
  alias NoneBoolType = (Nil | String | Float64 | Int32 | Int64 | UInt64 | Char)

  def to_f64
    puts "Can't coerce Bool to Float"
    abort "#{__FILE__}:#{__LINE__}"
  end

  def ^(arg : NoneBoolType)
    puts "No overload matches 'Bool#^'"
    abort "#{__FILE__}:#{__LINE__}"
  end
end
