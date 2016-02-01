# Macro does not work with +, -, *, /, etc.. :(

#macro fail_coercion(method, arg_type)
#  def {{method}}(arg : {{arg_type}})
#    raise("{{arg_type}} can't be coerced into Int")
#  end
#end

#fail_coercion +, Bool

struct Int
  alias NoneIntCompatibleType = Bool|Nil|String

  def +(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Int")
  end

  def -(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Int")
  end

  def *(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Int")
  end

  def /(arg : NoneIntCompatibleType)
    raise("#{arg.inspect} can't be coerced into Int")
  end
end
