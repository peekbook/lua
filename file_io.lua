-- Different way to work with file
-- r: Read only (default)
-- w: Write only (overwrites file or creates new file)
-- a: Append (writes data to the end of the file)
-- r+: Read and write (file must exist)
-- w+: Read and write (overwrites file or creates new file)
-- a+: Read and write (file must exist)

file = io.open("test.lua", "w+")

file:write("print(\"Random string of text\")\n")
file:write("print(\"Another random string of text\")\n")

file:seek("set", 0)

print(file:read("*a"))
file:close()


file = io.open("test.lua", "a+")

file:write("print(\"This is a new line of text\")\n")

file:seek("set", 0)
print(file:read("*a"))

file:close()