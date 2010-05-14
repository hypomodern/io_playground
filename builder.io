# 'forward' is the equivalent of Ruby's method_missing.

Builder := Object clone

Builder forward := method(
  # message is the method that we're forwarding. It has a slot named 'name'.
  writeln("<", call message name, ">")
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    if(content type == "Sequence", writeln(content))
  )
  writeln("</", call message name, ">")
)

Builder ul(
  li("Io"),
  li("Lua"),
  li("Javascript")
)