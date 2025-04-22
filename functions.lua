function add(a, b)
    return a + b
end

function subtract(a, b)
    return a - b
end

function multiply(a, b)
    return a * b
end

function divide(a, b)
    if b == 0 then
        return "Error: Division by zero"
    else
        return a / b
    end
end

function modulus(a, b)
    return a % b
end

print("Addition: ", add(5, 3))
print("Subtraction: ", subtract(5, 3))
print("Multiplication: ", multiply(5, 3))
print("Division: ", divide(5, 3))
print("Modulus: ", modulus(5, 3))



function splitString(str)
    local stringTable = {}
    local i = 1
    for word in (str):gmatch("[^%s]+") do
        stringTable[i] = word
        i = i + 1
    end
    return stringTable, i
end

splitStrTable, i = splitString("Hello World Lua Programming")

for j = 1, i - 1 do
    print("Word " .. j .. ": " .. splitStrTable[j])
end
