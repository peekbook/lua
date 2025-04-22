-- i = 1

-- while i <= 10 do
--     io.write("i = ", i, "\n")
--     i = i + 1
--     if  i == 5 then
--         break
--     end
-- end



-- repeat
--     io.write("Enter your guess: ")
--     guess = io.read()
-- until tonumber(guess) == 5


 
--for loop

-- for i = 1, 10 do
--     io.write("i = ", i, "\n")
-- end

-- for i = 1, 10, 2 do
--     io.write("i = ", i, "\n")
-- end


months = {
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
}

for key, value in pairs(months) do
    io.write(key, " = ", value, "\n")
end