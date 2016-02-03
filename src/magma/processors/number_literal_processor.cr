module Magma
  class NumberLiteralProcessor < NodeProcessor
    def process(node : Crystal::NumberLiteral)
      case node.kind
      when :i8, :i16, :i32, :i64
        node.value.to_i64
      when :u8, :u16, :u32, :u64
        node.value.to_u64
      when :f32, :f64,
        node.value.to_f64
      else
        abort "NumberLiteralProcessor:: unknown kind: #{node.kind.inspect}"
      end
    end
  end
end
