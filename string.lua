fname = "Salil"

lname = " Nair"

io.write("My name is ", fname .. lname, "\n")


quote= "A software engineer, I like to code in Lua. I dont care , I do yoga , I do meditation, I do exercise, I do gym, I do swimming, I do running, I do cycling, I do walking, I do jogging, I do dancing, I do singing, I do painting, I do drawing, I do photography, I do writing, I do reading, I do cooking, I do cleaning, I do gardening, I do shopping, I do travelling, I do exploring, I do learning, I do teaching. "
io.write("Size of string ", #quote, "\n")
io.write("Replace lorem with Lorem ", string.gsub(quote, "I", "Me"), "\n")
io.write("Index of Lua: ", string.find(quote, "Lua"), "\n")
--string upper
io.write("Uppercase: ", string.upper(quote), "\n")
--string lower
io.write("Lowercase: ", string.lower(quote), "\n")