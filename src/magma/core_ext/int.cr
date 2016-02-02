# Macro does not work with +, -, *, /, etc.. :(

#macro fail_coercion(method, arg_type)
#  def {{method}}(arg : {{arg_type}})
#    raise("{{arg_type}} can't be coerced into Int")
#  end
#end

#fail_coercion +, Bool



alias NoneIntCompatibleType = Bool|Nil|String|Char|AnyArray

struct Number
  def +(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Number")
  end

  def -(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Number")
  end

  def *(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Number")
  end

  def **(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Number")
  end

  def /(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Number")
  end

  def >(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Number")
  end

  def <(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Number")
  end
end
