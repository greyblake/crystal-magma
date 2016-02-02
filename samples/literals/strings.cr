"Saluton mondo!"

"\"" # double quote
"\\" # backslash
"\e" # escape
"\f" # form feed
"\n" # newline
"\r" # carriage return
"\t" # tab
"\v" # vertical tab

"\101" # == "A"
"\123" # == "S"
"\12"  # == "\n"
"\1"   # string with one character with code point 1

"\u0041" # == "A"

"\u{41}"    # == "A"
"\u{1F52E}" # == "🔮"

"hello
      world" # same as "hello\n      world"

"hello " \
"world, " \
"no newlines" # same as "hello world, no newlines"

"hello \
     world, \
     no newlines" # same as "hello world, no newlines"

# Supports double quotes and nested parenthesis
%(hello ("world")) # same as "hello (\"world\")"

# Supports double quotes and nested brackets
%[hello ["world"]] # same as "hello [\"world\"]"

# Supports double quotes and nested curlies
%{hello {"world"}} # same as "hello {\"world\"}"

# Supports double quotes and nested angles
%<hello <"world">> # same as "hello <\"world\">"

<<-XML
<parent>
  <child />
</parent>
XML

# Same as "Hello\n  world"
<<-STRING
  Hello
    world
  STRING

# Same as "  Hello\n    world"
<<-STRING
    Hello
      world
  STRING

a = 1
b = 2
"sum = #{a + b}"        # "sum = 3"
