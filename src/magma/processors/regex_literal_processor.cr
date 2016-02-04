module Magma
  class RegexLiteralProcessor < NodeProcessor
    def process(node : Crystal::RegexLiteral) : MObject
      source = gprocess(node.value).value as String
      regex = Regex.new(source, node.options)
      MRegex.new(regex)
    end
  end
end
