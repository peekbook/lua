doubleIt = function(x) return x * 2 end

print(doubleIt(5))

--Higher order function kind called closure
function outFunc()
    local i = 0
    return function()
        i = i + 1
        return i
    end
end

counter = outFunc()
print(counter())