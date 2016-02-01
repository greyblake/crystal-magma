

class Abc
  macro fail_coercion(arg_type, method)
    def {{method}}(arg : {{arg_type}})
      raise("{{arg_type}} can't be coerced into Int")
    end
  end

  fail_coercion String, \-
end
