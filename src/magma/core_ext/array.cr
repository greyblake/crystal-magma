class Array
  def <<(arg : AnyArray)
    puts "Array << Array is not supported"
    abort "#{__FILE__}:#{__LINE__}"
  end

  def to_f64
    puts "Undefined method Array.to_f64"
    abort "#{__FILE__}:#{__LINE__}"
  end
end
