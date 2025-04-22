function anySum(...)
    local sum = 0
    for i, v in ipairs({...}) do
        sum = sum + v
    end
    return sum
end

io.write("Sum of 1, 2, 3, 4, 5 = ", anySum(1, 2, 3, 4, 5), "\n")
io.write("Sum of 10, 20, 30 = ", anySum(10, 20, 30), "\n")