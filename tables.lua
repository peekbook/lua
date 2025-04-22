aTable = {}

for i = 1, 10 do
    aTable[i] = i * 2
end
print("aTable[1] = ", aTable[1])

io.write("number of items in aTable = ", #aTable, "\n")

table.insert(aTable, 1, 12)
print("aTable[1] = ", aTable[1])

print(table.concat(aTable, ", "))


table.remove(aTable, 1)

print(table.concat(aTable, ", "))


aMultiDTable = {}

for i = 1, 3 do
    aMultiDTable[i] = {}
    for j = 1, 3 do
        aMultiDTable[i][j] = i .. j
    end
end

print("aMultiDTable[1][1] = ", aMultiDTable[1][1])

--use for loop to print aMultiDTable

for i = 1, 3 do
    for j = 1, 3 do
        io.write("aMultiDTable[", i, "][", j, "] = ", aMultiDTable[i][j], "\n")
    end
end