# A proc without arguments
->{ 1 } # Proc(Int32)

# A proc with one argument
->(x : Int32) { x.to_s } # Proc(Int32, String)

# A proc with two arguments:
->(x : Int32, y : Int32) { x + y } # Proc(Int32, Int32, Int32)

Proc(Int32, String).new { |x| x.to_s } # Proc(Int32, String)

proc = ->(x : Int32, y : Int32) { x + y }
proc.call(1, 2) #=> 3
