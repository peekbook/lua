io.write("5 + 3 = ", 5+3, "\n")
io.write("5 - 3 = ", 5-3, "\n")
io.write("5 * 3 = ", 5*3, "\n")
io.write("5 / 3 = ", 5/3, "\n")
io.write("5 % 3 = ", 5%3, "\n")


io.write("floor(2.35) = ", math.floor(2.35), "\n")
io.write("ceil(2.35) = ", math.ceil(2.35), "\n")
io.write("max(2, 3) = ", math.max(2, 3), "\n")
io.write("min(2, 3) = ", math.min(2, 3), "\n")
io.write("pow(2, 3) = ", math.pow(2, 3), "\n")
io.write("sqrt(8) = ", math.sqrt(64), "\n")


io.write("math.random() = ", math.random(), "\n")
io.write("math.random(a) = ", math.random(10), "\n")
io.write("math.random(a, b) = ", math.random(5, 10), "\n")


io.write("math.randomseed() = ", math.randomseed(os.time()), "\n")

print(string.format("Pi= %.10f", math.pi))
